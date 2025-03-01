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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
