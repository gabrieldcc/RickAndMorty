//
//  AppRouter.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 27/01/23.
//

import Foundation
import UIKit

class AppRouter {
    
    var window: UIWindow
    var loginRouter: LoginRouter?
    var homeRouter: HomeRouter?
    var registerRouter: RegisterRouter?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setRootViewController() {
        setLoginRouter()
    }
    
    func setLoginRouter() {
        loginRouter = LoginRouter(window: window)
        loginRouter?.setRootViewController()
        loginRouter?.delegate = self
    }
    
    func setHomeRouter() {
        homeRouter = HomeRouter(window: window)
        homeRouter?.setRootViewController()
    }
    
    func setRegisterRouter() {
        registerRouter = RegisterRouter(window: window)
        registerRouter?.setRootViewController()
    }
}

extension AppRouter: LoginRouterDelegate {
    func signUpRouterDelegate() {
        setRegisterRouter()
    }
    
    func successfullLoginRouterDelegate() {
        setHomeRouter()
    }
}
