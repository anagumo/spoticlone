//
//  PlaylistsTableViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

import UIKit

enum PlaylistSection {
    case playlists
}

final class PlaylistsTableViewController: UITableViewController {
    // MARK: DataSource
    typealias DataSource = UITableViewDiffableDataSource<PlaylistSection, Playlist>
    typealias Snapshot = NSDiffableDataSourceSnapshot<PlaylistSection, Playlist>
    private var dataSource: DataSource?
    private let playlists = PlaylistLocalRepository.playlists
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRightBarButtonItem()
        configureTableView()
    }
    
    private func configureRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .play,
            target: self,
            action: #selector(playButtonTapped)
        )
    }
    
    private func configureTableView() {
        // Create a uiNib from the XIB file
        let playlistUiNib = UINib(nibName: PlaylistTableViewCell.identifier, bundle: nil)
        // Register cell
        tableView.register(playlistUiNib, forCellReuseIdentifier: PlaylistTableViewCell.identifier)
        // Create the data source
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, playlist in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistTableViewCell.identifier, for: indexPath) as? PlaylistTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: playlist)
            return cell
        })
        // Set the data source to the table view
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.backgroundColor = .spotiblack
        tableView.separatorStyle = .none
        // Create snapshot
        var snapshot = Snapshot()
        snapshot.appendSections([.playlists])
        snapshot.appendItems(playlists)
        // Apply the snapshot to the data source
        dataSource?.applySnapshotUsingReloadData(snapshot)
    }
    
    // MARK: - Call to actions
    /// This function receives the "Touch Up Inside" event when user taps the play button
    /// - Discussion: Displays the data song in the player
    @objc func playButtonTapped() {
        // Set song as nil since the target is not from a specified song
        let playerViewController = PlayerViewController(song: nil)
        navigationController?.modalPresentationStyle = .popover
        navigationController?.present(playerViewController, animated: true)
    }
}

// MARK: Playlist Table View Delegate
extension PlaylistsTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playlist = playlists[indexPath.row]
        let songsViewController = SongsTableViewController(playlist: playlist)
        navigationController?.show(songsViewController, sender: self)
    }
}
