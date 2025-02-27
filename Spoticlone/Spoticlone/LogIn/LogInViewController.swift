//
//  LogInViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 26/02/25.
//

import UIKit

final class LogInViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LogInViewController {
    /// UI Components customization
    func customizeButtons() {
        var logInButtonConfiguration = UIButton.Configuration.filled()
        logInButtonConfiguration.cornerStyle = .capsule
        logInButtonConfiguration.baseBackgroundColor = .spotigray
        logInButtonConfiguration.attributedTitle = AttributedString(
            "Log in",
            attributes: AttributeContainer([
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.spotiblack
            ])
        )
        loginButton.configuration = logInButtonConfiguration
    }
}
