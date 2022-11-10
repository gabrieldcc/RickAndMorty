//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 10/11/22.
//

import UIKit

final class DetailView: UIView {
    
    var selectItem: MainData?
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .blue
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Visual Components
    private lazy var container: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .center
        element.distribution = .fill
        element.spacing = 16
        
        return element
    }()
    
    lazy var characterImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "loading")
        element.tintColor = .blue
        element.layer.cornerRadius = 25
        element.layer.masksToBounds = true
        
        return element
    }()
    
    private lazy var containerLabelsHStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        element.backgroundColor = .darkGray
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true
        
        return element
    }()
    
    private lazy var titleLabelsVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        element.backgroundColor = .darkGray
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true
        
        return element
    }()
    
    
    private lazy var dinamicLabelsVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        element.backgroundColor = .darkGray
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true
        
        return element
    }()
    
    //MARK: - Title Labels
    lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Name"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var statusLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "status"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var speciesLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "species"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var genderLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "gender"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var originLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "origin"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var lastSeenInLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "lastSeenIn"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    //MARK: - Dinamic Labels
    lazy var nameDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Name"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var statusDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "status"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var speciesDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "species"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var genderDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "gender"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var originDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "origin"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
    lazy var lastSeenInDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "lastSeenIn"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        
        return element
    }()
    
}
//MARK: - ViewCodable
extension DetailView: ViewCodable {
    func buildHierarchy() {
        addSubview(container)
        container.addArrangedSubview(characterImage)
        container.addArrangedSubview(containerLabelsHStack)
        containerLabelsHStack.addArrangedSubview(titleLabelsVStack)
        containerLabelsHStack.addArrangedSubview(dinamicLabelsVStack)

        titleLabelsVStack.addArrangedSubview(nameLabel)
        titleLabelsVStack.addArrangedSubview(statusLabel)
        titleLabelsVStack.addArrangedSubview(speciesLabel)
        titleLabelsVStack.addArrangedSubview(genderLabel)
        titleLabelsVStack.addArrangedSubview(originLabel)
        titleLabelsVStack.addArrangedSubview(lastSeenInLabel)
        
        dinamicLabelsVStack.addArrangedSubview(nameDinamicLabel)
        dinamicLabelsVStack.addArrangedSubview(statusDinamicLabel)
        dinamicLabelsVStack.addArrangedSubview(speciesDinamicLabel)
        dinamicLabelsVStack.addArrangedSubview(genderDinamicLabel)
        dinamicLabelsVStack.addArrangedSubview(originDinamicLabel)
        dinamicLabelsVStack.addArrangedSubview(lastSeenInDinamicLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            characterImage.widthAnchor.constraint(equalToConstant: 320),
            characterImage.heightAnchor.constraint(equalToConstant: 400),
            
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameDinamicLabel.widthAnchor.constraint(equalToConstant: 220)
            

        ])
    }
    
}

