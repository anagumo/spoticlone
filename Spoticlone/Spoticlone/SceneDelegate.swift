//
//  SceneDelegate.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 26/02/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController()
        let signInViewController = SignInViewController()
        navigationController.viewControllers = [signInViewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

