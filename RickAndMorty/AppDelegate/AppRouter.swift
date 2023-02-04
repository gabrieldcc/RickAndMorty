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
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setRootViewController() {
        setLoginRouter()
    }
    
    func setLoginRouter() {
        loginRouter = LoginRouter(window: window)
        loginRouter?.setRootViewController()
    }
    
    func setHomeRouter() {
        homeRouter = HomeRouter(window: window)
        homeRouter?.setRootViewController()
    }
}
