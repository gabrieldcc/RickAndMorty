//
//  LoginRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 27/01/23.
//

import Foundation
import UIKit

protocol LoginRouterDelegate: AnyObject {
    func successfullLogin()
}

class LoginRouter {
    
    var window: UIWindow
    var loginViewController: LoginViewController?
    weak var delegate: LoginRouterDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setRootViewController() {
        loginViewController = LoginViewController()
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
}
