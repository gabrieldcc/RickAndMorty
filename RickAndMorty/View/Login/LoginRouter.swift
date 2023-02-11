//
//  LoginRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 27/01/23.
//

import Foundation
import UIKit

protocol LoginRouterDelegate: AnyObject {
    func successfullLoginRouterDelegate()
    func signUpRouterDelegate()
}

final class LoginRouter {
    
    var window: UIWindow
    var loginViewController: LoginViewController?
    weak var delegate: LoginRouterDelegate?

    init(window: UIWindow) {
        self.window = window
    }

    func setRootViewController() {
        loginViewController = LoginViewController()
        loginViewController?.delegate = self
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
}

extension LoginRouter: LoginViewControllerDelegate {
    
    func signUp() {
        delegate?.signUpRouterDelegate()
    }
    
    func successfullLogin() {
        delegate?.successfullLoginRouterDelegate()
    }
}
