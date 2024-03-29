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
    //MARK: - Attributes
    var window: UIWindow
    var loginViewController: LoginViewController?
    weak var delegate: LoginRouterDelegate?

    //MARK: - Init
    init(window: UIWindow) {
        self.window = window
    }

    //MARK: - Funcs
    func setRootViewController() {
        loginViewController = LoginViewController()
        loginViewController?.delegate = self
        let navigationDefault = UINavigationController()
        let navigation = UINavigationController(
            rootViewController: loginViewController ?? navigationDefault
        )
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}

    //MARK: - LoginViewControllerDelegate
extension LoginRouter: LoginViewControllerDelegate {
    func signUp() {
        self.delegate?.signUpRouterDelegate()
    }
    
    func successfullLogin() {
        delegate?.successfullLoginRouterDelegate()
    }
}
