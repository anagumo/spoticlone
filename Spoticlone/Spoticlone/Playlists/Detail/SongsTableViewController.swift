//
//  PlaylistDetailTableViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 01/03/25.
//

import UIKit

enum SongsSection {
    case songs
}

final class SongsTableViewController: UITableViewController {
    // MARK: - DataSource
    typealias DataSource = UITableViewDiffableDataSource<SongsSection, Song>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SongsSection, Song>
    private var dataSource: DataSource?
    private var playlist: Playlist
    
    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        configureTableView()
    }
    
    private func configureTableView() {
        let songUiNib = UINib(nibName: SongTableViewCell.identifier, bundle: nil)
        tableView.register(songUiNib, forCellReuseIdentifier: SongTableViewCell.identifier)
        
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, song in
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: SongTableViewCell.identifier, for: indexPath) as? SongTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: song)
            return cell
        })
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.backgroundColor = .spotiblack
        
        var snapshot = Snapshot()
        snapshot.appendSections([.songs])
        snapshot.appendItems(playlist.songs)
        
        dataSource?.applySnapshotUsingReloadData(snapshot)
    }
}

// MARK: Songs Table View Delegate
extension SongsTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    // MARK: - Call to action
    /// This function receives the "Touch Up Inside" event when user taps in a specifc song
    /// - Discussion: Displays the data song in the player
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = playlist.songs[indexPath.row]
        let playerViewController = PlayerViewController(song: song)
        navigationController?.modalPresentationStyle = .popover
        navigationController?.present(playerViewController, animated: true)
    }
}
