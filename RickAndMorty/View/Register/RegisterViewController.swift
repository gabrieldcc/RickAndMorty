//
//  RegisterViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 10/02/23.
//

import Foundation
import UIKit
import FirebaseAuth

protocol RegisterViewControllerDelegate: AnyObject {}


class RegisterViewController: UIViewController {
    //MARK: - Vars
    let containerView = RegisterView()
    weak var delegate: RegisterViewControllerDelegate?
    var interactor = RegisterInteractor()
    
    //MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpButton()
    }
    
    private func setupSignUpButton() {
        containerView.signUpButton.addTarget(
            self,
            action: #selector(signUpButtonTarget),
            for: .touchUpInside
        )
    }
    
    @objc func signUpButtonTarget() {
        let email = containerView.loginTextField.text ?? ""
        let password = containerView.passwordTextField.text ?? ""
        interactor.createUser(
            email: email,
            password: password
        )
        singUpSuccessHandler()
        singUpFailHandler()
    }
    
    func singUpSuccessHandler() {
        interactor.isUserValid = { [weak self] in
            UIAlertDefault.showAlert(
                title: "Parabéns",
                message: RegisterStrings.successful,
                buttonTitle: "Ok",
                controller: self
            )
        }
    }
    
    func singUpFailHandler() {
        interactor.isNotUserValid = { [weak self] in
            UIAlertDefault.showAlert(
                title: "Que pena!",
                message: RegisterStrings.fail,
                buttonTitle: "Ok",
                controller: self
            )
        }
    }
}
