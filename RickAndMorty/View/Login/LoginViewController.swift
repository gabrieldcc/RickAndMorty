//
//  LoginViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func validateUserLogin(loginInputed: UserLogin) -> Bool
}

final class LoginViewController: UIViewController {
    
    //MARK: - Let
    let containerView = LoginView()
    weak var delegate: LoginViewControllerDelegate?
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    //TODO: 
    func tapButton() {
        
    }
}
