//
//  SearchCollectionViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

import UIKit
import OSLog

enum SearchSection {
    case search
}

final class SearchCollectionViewController: UICollectionViewController {
    // MARK: - Datasource
    typealias DataSource = UICollectionViewDiffableDataSource<SearchSection, Genre>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SearchSection, Genre>
    private var dataSource: DataSource?
    private var genres = GenreLocalRepository.genres
    // MARK: - Search
    private var searchController: UISearchController?
    private var filteredGenres: [Genre] = []
    
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
        configureSearchController()
        configureCollectionView()
    }
    
    private func configureRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .play,
            target: self,
            action: #selector(playButtonTapped)
        )
    }
    
    /// Configure a search bar to filter genres
    private func configureSearchController() {
        // Create the search controller and set this screen as search result container
        searchController = UISearchController(searchResultsController: nil)
        // Set the responsability to this controller of any text changes within search bar and update results
        searchController?.searchResultsUpdater = self
        // Set off the property that obscures the screen while searching
        searchController?.obscuresBackgroundDuringPresentation = false
        // Place search bar in the navigation bar since is not compatible do this from IB
        navigationItem.searchController = searchController
        // Changes the search bar text color to white, set after set the controller
        searchController?.searchBar.searchTextField.textColor = .white
        // Dispaly the search bar always
        navigationItem.hidesSearchBarWhenScrolling = false
        // Hide the search bar when user navigates to another screen
        definesPresentationContext = true
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
        // Create snapshot
        applySnapshot(genres)
    }
    
    private func applySnapshot(_ genres: [Genre]) {
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

// MARK: - CollectionView Delegates
extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberCollumn: CGFloat = 2
        let itemWidth = (collectionView.frame.size.width - 32) / numberCollumn
        return CGSize(width: itemWidth, height: 110)
    }
}

// MARK: Search Controller Delegates
extension SearchCollectionViewController: UISearchResultsUpdating {
    
    /// Update search results based on the text entered in the search bar
    /// - Parameter searchController: a controller of type `(UISearchController)` that represent an instance of the search bar
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputText = searchController.searchBar.text, !inputText.isEmpty else {
            Logger.debug.log("Search bar is empty")
            // Restore the data source after clearing the search
            applySnapshot(genres)
            return
        }
        Logger.debug.log("Input text: \(inputText)")
        // Filter and update the data source
        filterGenres(inputText: inputText)
        applySnapshot(filteredGenres)
    }
    
    /// Filter the genres array based on the search bar input
    /// - Parameter inputText: a text of type `(String)` the data entered by the user in the search bar
    private func filterGenres(inputText: String) {
        filteredGenres = genres.filter({
            $0.name
                .lowercased()
                .contains(inputText.lowercased()) // Lowercase version of the input to find "Funk" and "funk"
        })
        let genresFound = filteredGenres.compactMap { $0.name }
        Logger.debug.log("Results: \(genresFound.debugDescription)")
    }
}
