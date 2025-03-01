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
    typealias DataSource = UICollectionViewDiffableDataSource<SearchSection, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SearchSection, String>
    private var dataSource: DataSource?
    
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
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        // Create a UINib from the XIB file
        let searchUINib = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)
        // Register the search cell
        let registration = UICollectionView.CellRegistration<SearchCollectionViewCell, String>(cellNib: searchUINib) { cell, indexPath, genre in
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
        // Create a snapshot
        var snapshot = Snapshot()
        snapshot.appendSections([.search])
        snapshot.appendItems(["Pop"])
        // Apply the snapshot to the data source
        dataSource?.applySnapshotUsingReloadData(snapshot)
    }
}
