//
//  SceneDelegate.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 17.03.2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let loginView = LoginView()
        
        let mainView = MainView(showSheetView: .constant(true))
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            if UserDefaults.standard.bool(forKey: "logged") {
                window.rootViewController = UIHostingController(rootView: mainView)
            } else {
                window.rootViewController = UIHostingController(rootView: loginView)
            }
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    func sceneWillResignActive(_ scene: UIScene) {
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
