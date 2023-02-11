//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import UIKit
import FirebaseCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        appRouter = AppRouter(window: window ?? UIWindow())
        appRouter?.setRootViewController()
    }
}

