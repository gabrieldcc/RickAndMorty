//
//  LoginView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.

import Foundation
import UIKit

final class LoginView: UIView {
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
    private lazy var rotateImageContainerView: UIView = {
        let element = UIView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .black
        return element
    }()
    
    private lazy var rotateImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 25
        element.layer.masksToBounds = true
        element.backgroundColor = .black
        element.image = UIImage(named: "portalRick")
        element.rotate(duration: 5)
        return element
    }()
    
    private lazy var loginBackgroundVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        let green: CGColor = .init(red: 0, green: 255, blue: 0, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 10
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true
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
        element.text = "gabrieldcc@gmail.com"
        element.autocapitalizationType = .none
        return element
    }()
    
    private lazy var passwordLabel: UILabelDefault = {
        let element = UILabelDefault(text: "Senha")
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
    
    lazy var loginButton: UIButtonDefault = {
        let element = UIButtonDefault(
            title: "Fazer login",
            target: self,
            forEvent: .touchUpInside
        )
        element.backgroundColor = .green
        element.setTitleColor(.black, for: .normal)
        return element
    }()
    
    lazy var registerButton: UIButtonDefault = {
        let element = UIButtonDefault(
            title: "Cadastrar-se",
            target: self,
            forEvent: .touchUpInside
        )
        element.backgroundColor = .white
        element.setTitleColor(.black, for: .normal)
        return element
    }()
}

    //MARK: - ViewCodable
extension LoginView: ViewCodableProtocol {
    func buildHierarchy() {
        addSubview(loginBackgroundVStack)
        addSubview(rotateImageContainerView)
        addSubview(loginButton)
        addSubview(registerButton)
        containerView.addSubview(containerVStack)
        rotateImageContainerView.addSubview(rotateImage)
        
        ViewCodable.addArrangedSubviews(
            stackView: loginBackgroundVStack,
            subviews: [containerView]
        )
        
        ViewCodable.addArrangedSubviews(
            stackView: containerVStack,
            subviews: [
                loginContainerVStack,
                passwordContainerVStack
            ]
        )
        
        ViewCodable.addArrangedSubviews(
            stackView: loginContainerVStack,
            subviews: [
                loginLabel,
                loginTextField,
            ]
        )
        
        ViewCodable.addArrangedSubviews(
            stackView: passwordContainerVStack,
            subviews: [
                passwordLabel,
                passwordTextField,
            ]
        )
    }
    
    func setupConstraints() {
        let defaultSize: CGFloat = 44
        let defaultSizeN: CGFloat = -44
        
        NSLayoutConstraint.activate([
            rotateImageContainerView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            rotateImageContainerView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            rotateImageContainerView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
            
            rotateImage.heightAnchor.constraint(equalToConstant: 280),
            rotateImage.widthAnchor.constraint(equalToConstant: 280),
            
            loginBackgroundVStack.topAnchor.constraint(
                equalTo: rotateImage.bottomAnchor,
                constant: defaultSize
            ),
            loginBackgroundVStack.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            loginBackgroundVStack.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            loginBackgroundVStack.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
            
            
            containerView.topAnchor.constraint(
                equalTo: loginBackgroundVStack.topAnchor
            ),
            containerView.bottomAnchor.constraint(
                equalTo: loginBackgroundVStack.bottomAnchor
            ),
            containerView.leadingAnchor.constraint(
                equalTo: loginBackgroundVStack.leadingAnchor
            ),
            containerView.trailingAnchor.constraint(
                equalTo: loginBackgroundVStack.trailingAnchor
            ),
            
            containerVStack.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 10
            ),
            containerVStack.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -10
            ),
            containerVStack.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 10
            ),
            containerVStack.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -10
            ),
            
            loginLabel.heightAnchor.constraint(equalToConstant: defaultSize),
            loginTextField.heightAnchor.constraint(equalToConstant: defaultSize),
            passwordLabel.heightAnchor.constraint(equalToConstant: defaultSize),
            passwordTextField.heightAnchor.constraint(equalToConstant: defaultSize),
            
            loginButton.heightAnchor.constraint(
                equalToConstant: defaultSize
            ),
            loginButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
            loginButton.bottomAnchor.constraint(
                equalTo: registerButton.topAnchor,
                constant: -10
            ),
            registerButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: defaultSizeN
            ),
            registerButton.heightAnchor.constraint(
                equalToConstant: defaultSize
            ),
            registerButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: defaultSize
            ),
            registerButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: defaultSizeN
            ),
        ])
    }
}
