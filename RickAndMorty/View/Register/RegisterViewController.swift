//
//  RegisterViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 10/02/23.
//

import Foundation
import UIKit


class RegisterViewController: UIViewController {
    //MARK: - Vars
    let containerView = RegisterView()
    
    
    //MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
