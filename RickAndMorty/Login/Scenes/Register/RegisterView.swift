//
//  LoginView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.


import Foundation
import UIKit

final class RegisterView: UIView {
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .black
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Visual Components
    private lazy var mainStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        let green: CGColor = .init(red: 0, green: 255, blue: 0, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 10
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var containerView: UIView = {
        let element = UIView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .black
        return element
    }()
    
    private lazy var containerVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .fill
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var loginContainerVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .fill
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var passwordContainerVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .fill
        element.distribution = .fill
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var loginLabel: UILabelDefault = {
        let element = UILabelDefault(text: "Login")
        return element
    }()
    
    lazy var loginTextField: UITextFieldDefault = {
        let element = UITextFieldDefault(
            placeholder: "  Digite seu login"
        )
        element.text = "Gabrieldcc"
        element.autocapitalizationType = .none
        return element
    }()
    
    private lazy var passwordLabel: UILabelDefault = {
        let element = UILabelDefault(
            text: "Senha"
        )
        return element
    }()
    
    lazy var passwordTextField: UITextField = {
        let element = UITextFieldDefault(
            placeholder: "  Digite sua senha"
        )
        element.text = "Gabriel98$"
        element.autocapitalizationType = .none
        element.isSecureTextEntry = true
        return element
    }()
    
    lazy var signUpButton: UIButtonDefault = {
        let element = UIButtonDefault(
            title: "Finalizar cadastro",
            target: self,
            forEvent: .touchUpInside
        )
        element.setTitleColor(.black, for: .normal)
        return element
    }()
}

    //MARK: - ViewCodable
extension RegisterView: ViewCodableProtocol {
    func buildHierarchy() {
        addSubview(mainStack)
        addSubview(signUpButton)
        containerView.addSubview(containerVStack)
        mainStack.addArrangedSubview(containerView)
        containerVStack.addArrangedSubview(loginContainerVStack)
        containerVStack.addArrangedSubview(passwordContainerVStack)
        loginContainerVStack.addArrangedSubview(loginLabel)
        loginContainerVStack.addArrangedSubview(loginTextField)
        passwordContainerVStack.addArrangedSubview(passwordLabel)
        passwordContainerVStack.addArrangedSubview(passwordTextField)
    }
    
    func setupConstraints() {
        let constraintDefault: CGFloat = 44
        let constraintDefaultNegative: CGFloat = -44
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: constraintDefault),
            mainStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: constraintDefault),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: constraintDefaultNegative),
            
            
            containerView.topAnchor.constraint(equalTo: mainStack.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: mainStack.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            
            containerVStack.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 10),
            containerVStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -10),
            containerVStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            containerVStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            
            loginLabel.heightAnchor.constraint(equalToConstant: constraintDefault),
            
            loginTextField.heightAnchor.constraint(equalToConstant: constraintDefault),
            
            passwordLabel.heightAnchor.constraint(equalToConstant: constraintDefault),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: constraintDefault),
            
            signUpButton.heightAnchor.constraint(equalToConstant: constraintDefault),
            signUpButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: constraintDefault),
            signUpButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: constraintDefaultNegative),
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: constraintDefaultNegative),
        ])
    }
}
