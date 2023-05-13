//
//  RegisterRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 11/02/23.
//

import Foundation
import UIKit

protocol RegisterRouterDelegate: AnyObject {
    func loginRouterDelegate()
}

final class RegisterRouter {
    //MARK: - Attributes
    var window: UIWindow
    var registerViewController: RegisterViewController?
    weak var delegate: RegisterRouterDelegate?

    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Funcs
    func setRootViewController() {
        registerViewController = RegisterViewController()
        registerViewController?.delegate = self
        window.rootViewController = UINavigationController(rootViewController: registerViewController ?? UINavigationController())
        window.makeKeyAndVisible()
    }
}

extension RegisterRouter: RegisterViewControllerDelegate {
    func goToLoginScreen() {
        self.delegate?.loginRouterDelegate()
    }
}
