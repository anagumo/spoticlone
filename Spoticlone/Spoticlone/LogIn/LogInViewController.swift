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
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUIComponents()
    }
}

extension LogInViewController {
    /// UI Components customization
    func customizeUIComponents() {
        // Change the navigation items color
        navigationController?.navigationBar.tintColor = .white
        
        var logInButtonConfiguration = UIButton.Configuration.filled()
        logInButtonConfiguration.cornerStyle = .capsule
        logInButtonConfiguration.baseBackgroundColor = .spotigray
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
