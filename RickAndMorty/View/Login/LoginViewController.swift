//
//  LoginViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Let
    let containerView = LoginView()
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    
}
