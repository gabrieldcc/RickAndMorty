//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 22/12/22.
//

import UIKit

final class DetailsView: UIView {
    
    //MARK: - Var
    var selectItem: MainData?
    var homeView = HomeView()
    
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
        element.tintColor = .black
        element.layer.cornerRadius = 25
        element.layer.masksToBounds = true
        element.backgroundColor = .white
        
        return element
    }()
    
    private lazy var containerLabelsHStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
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
    
    //MARK: - Title Labels
    private lazy var titleLabelsVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        element.backgroundColor = .black
        
        return element
    }()
    
    lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Name"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var statusLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Status"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var speciesLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Species"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var genderLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Gender"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor

        return element
    }()
    
    lazy var originLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Origin"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var lastSeenInLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Last seen in"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor

        return element
    }()
    
    //MARK: - Dinamic Labels
    private lazy var dinamicLabelsVStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        element.backgroundColor = .black
        
        return element
    }()
    
    lazy var nameDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Name"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var statusDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "status"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor

        return element
    }()
    
    lazy var speciesDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "species"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor

        return element
    }()
    
    lazy var genderDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "gender"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var originDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "origin"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
    lazy var lastSeenInDinamicLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "lastSeenIn"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        element.textAlignment = .left
        element.textColor = labelTextColor
        
        return element
    }()
    
     func updateLabels(character: Character) {
        nameDinamicLabel.text = character.name
        statusDinamicLabel.text = character.status.rawValue
        speciesDinamicLabel.text = character.species.rawValue
        genderLabel.text = character.gender.rawValue
        originLabel.text = character.origin.name
        characterImage.loadFrom(URLAddress: character.image)
        print("IMAGE ---->\(String(describing: characterImage.image))")
    }
    
}
//MARK: - ViewCodable
extension DetailsView: ViewCodable {
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
            container.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 40),
            container.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -40),
            container.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 40),
            
            characterImage.widthAnchor.constraint(equalToConstant: 320),
            characterImage.heightAnchor.constraint(equalToConstant: 400),
            
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameDinamicLabel.widthAnchor.constraint(equalToConstant: 220),
            
            titleLabelsVStack.leadingAnchor.constraint(
                equalTo: containerLabelsHStack.leadingAnchor,
                constant: 8),
            titleLabelsVStack.topAnchor.constraint(
                equalTo: containerLabelsHStack.topAnchor,
                constant: 8),
            titleLabelsVStack.bottomAnchor.constraint(
                equalTo: containerLabelsHStack.bottomAnchor,
                constant: -8),
            
            dinamicLabelsVStack.trailingAnchor.constraint(
                equalTo: containerLabelsHStack.trailingAnchor,
                constant: -8),
            dinamicLabelsVStack.topAnchor.constraint(
                equalTo: containerLabelsHStack.topAnchor,
                constant: 8),
            dinamicLabelsVStack.bottomAnchor.constraint(
                equalTo: containerLabelsHStack.bottomAnchor,
                constant: -8),
        ])
    }
    
}
