//
//  RegisterRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 11/02/23.
//

import Foundation
import UIKit

final class RegisterRouter: RegisterViewControllerDelegate {
    
    var window: UIWindow
    var registerViewController: RegisterViewController?

    init(window: UIWindow) {
        self.window = window
    }

    func setRootViewController() {
        registerViewController = RegisterViewController()
        registerViewController?.delegate = self
        window.rootViewController = UINavigationController(rootViewController: registerViewController ?? UINavigationController())
        window.makeKeyAndVisible()
    }
}
