//
//  SearchCollectionViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

import UIKit

enum SearchSection {
    case search
}

final class SearchCollectionViewController: UICollectionViewController {
    // MARK: - Datasource
    typealias DataSource = UICollectionViewDiffableDataSource<SearchSection, Genre>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SearchSection, Genre>
    private var dataSource: DataSource?
    private var genres = GenreLocalRepository.genres
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.scrollDirection = .vertical
        super.init(collectionViewLayout: flowLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRightBarButtonItem()
        configureCollectionView()
    }
    
    private func configureRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .play,
            target: self,
            action: #selector(playButtonTapped)
        )
    }
    
    private func configureCollectionView() {
        // Create a UINib from the XIB file
        let searchUINib = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)
        // Register the search cell
        let registration = UICollectionView.CellRegistration<SearchCollectionViewCell, Genre>(cellNib: searchUINib) { cell, indexPath, genre in
            cell.configure(genre: genre)
        }
        // Create the data source
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, genre in
            collectionView.dequeueConfiguredReusableCell(
                using: registration,
                for: indexPath,
                item: genre)
        })
        // Set the data source to the collection
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .spotiblack
        // Create a snapshot
        var snapshot = Snapshot()
        snapshot.appendSections([.search])
        snapshot.appendItems(genres)
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

// MARK: - Search View Controller Delegate
extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberCollumn: CGFloat = 2
        let itemWidth = (collectionView.frame.size.width - 32) / numberCollumn
        return CGSize(width: itemWidth, height: 110)
    }
}
