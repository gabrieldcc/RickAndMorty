//
//  LoginView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 26/01/23.
//

import Foundation
import UIKit

final class LoginView: UIView {
    
    //MARK: - Var
    var loginView: LoginViewController?
    
    //MARK: - Let
    private let labelTextColor: UIColor = .white
    
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
    
    private lazy var vStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        element.backgroundColor = .black
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true
        element.layer.borderColor = .init(red: 0, green: 255, blue: 0, alpha: 1)
        element.layer.borderWidth = 1
        
        return element
    }()
    
    private lazy var loginLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Login"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    private lazy var loginTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Login"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    private lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    private lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
}

//MARK: - ViewCodable
extension LoginView: ViewCodableProtocol {
    func buildHierarchy() {
        addSubview(vStack)
        
        ViewCodable.addArrangedSubviews(
            stackView: vStack,
            subviews: [
                loginLabel,
                loginTextField,
                passwordLabel,
                passwordTextField
            ]
        )
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            vStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            vStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
        ])
    }
}
