//
//  SignInViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 26/02/25.
//

import UIKit

final class SignInViewController: UIViewController {

    // MARK: UI Components
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var continueWithAppleButton: UIButton!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButtons()
    }
    
    @IBAction func didLogInButtonTapped() {
        let logInController = LogInViewController()
        navigationController?.pushViewController(logInController, animated: true)
    }
}

extension SignInViewController {
    /// UI components customization
    private func customizeButtons() {
        var signUpConfiguration = UIButton.Configuration.filled()
        signUpConfiguration.cornerStyle = .capsule
        signUpConfiguration.baseBackgroundColor = .spotigreen
        signUpConfiguration.image = UIImage(systemName: "envelope")
        signUpConfiguration.imagePlacement = .leading
        signUpConfiguration.imagePadding = 16
        signUpConfiguration.baseForegroundColor = .black
        signUpConfiguration.attributedTitle = AttributedString(
            "Sign up free",
            attributes: AttributeContainer([
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.black
            ])
        )
        signUpButton.configuration = signUpConfiguration
        
        var continueWithAppleConfiguration = UIButton.Configuration.bordered()
        continueWithAppleConfiguration.cornerStyle = .capsule
        continueWithAppleConfiguration.background.strokeWidth = 2
        continueWithAppleConfiguration.background.strokeColor = .spotigray
        continueWithAppleConfiguration.baseBackgroundColor = .spotiblack
        continueWithAppleConfiguration.image = UIImage(systemName: "apple.logo")
        continueWithAppleConfiguration.imagePlacement = .leading
        continueWithAppleConfiguration.imagePadding = 16
        continueWithAppleConfiguration.baseForegroundColor = .white
        continueWithAppleConfiguration.attributedTitle = AttributedString(
            "Continue with Apple",
            attributes: AttributeContainer([
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.white
            ])
        )
        continueWithAppleButton.configuration = continueWithAppleConfiguration
    }
}
