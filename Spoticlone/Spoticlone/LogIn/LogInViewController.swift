//
//  LogInViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 26/02/25.
//

import UIKit

final class LogInViewController: UIViewController {
    // MARK: - UI Components
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUIComponents()
    }
    
    // MARK: - Call to actions
    @IBAction func loginButtonTapped() {
        let mainTabBarController = UITabBarController()
        mainTabBarController.tabBar.tintColor = .white
        mainTabBarController.tabBar.unselectedItemTintColor = .white
        mainTabBarController.tabBar.barTintColor = .spotiblack
        let searchCollectionViewController = SearchCollectionViewController()
        searchCollectionViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        let playlistsViewController = PlaylistsTableViewController()
        let playlistsNavigationController = UINavigationController(rootViewController: playlistsViewController)
        playlistsNavigationController.tabBarItem = UITabBarItem(
            title: "Playlists",
            image: UIImage(systemName: "list.bullet.rectangle.portrait"),
            selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        mainTabBarController.viewControllers = [
            searchCollectionViewController,
            playlistsNavigationController
        ]
        // Replace all controllers on the navigation stack
        navigationController?.setViewControllers([mainTabBarController], animated: true)
    }
}

extension LogInViewController {
    /// UI Components customization
    func customizeUIComponents() {
        var logInButtonConfiguration = UIButton.Configuration.filled()
        logInButtonConfiguration.cornerStyle = .capsule
        logInButtonConfiguration.baseBackgroundColor = .sGrayLight
        logInButtonConfiguration.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 20,
            bottom: 10,
            trailing: 20)
        logInButtonConfiguration.attributedTitle = AttributedString(
            "Log in",
            attributes: AttributeContainer([
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.spotiblack
            ])
        )
        loginButton.configuration = logInButtonConfiguration
    }
}
