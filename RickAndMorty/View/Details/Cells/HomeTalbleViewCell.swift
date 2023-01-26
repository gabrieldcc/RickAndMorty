//
//  HomeTalbleViewCell.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import Foundation
import UIKit


class HomeTableViewCell: UITableViewCell {
    
    //MARK: - Attributes
    static let identifier = "HomeTableViewCell"
    static let cellSize: CGFloat = 120
    
    let textLabelSize: CGFloat = 13
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Visual Components
    private lazy var container: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
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
    
    private lazy var vStack: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        
        return element
    }()
    
     lazy var nameLabel: UILabel = {
            let element = UILabel()
            element.translatesAutoresizingMaskIntoConstraints = false
            element.text = "Name"
            element.font = UIFont.boldSystemFont(ofSize: 16)
            
            return element
        }()
    
     lazy var statusLabel: UILabel = {
            let element = UILabel()
            element.translatesAutoresizingMaskIntoConstraints = false
            element.text = "Status"
         element.font = UIFont.systemFont(ofSize: textLabelSize)
            
            return element
        }()
    
     lazy var specieLabel: UILabel = {
            let element = UILabel()
            element.translatesAutoresizingMaskIntoConstraints = false
            element.text = "Specie"
            element.font = UIFont.systemFont(ofSize: textLabelSize)
            
            return element
        }()
    
     lazy var genderLabel: UILabel = {
            let element = UILabel()
            element.translatesAutoresizingMaskIntoConstraints = false
            element.text = "Gender"
            element.font = UIFont.systemFont(ofSize: textLabelSize)
            
            return element
        }()
    
}

extension HomeTableViewCell: ViewCodable {
    func buildHierarchy() {
        addSubview(container)
        container.addArrangedSubview(characterImage)
        container.addArrangedSubview(vStack)
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(statusLabel)
        vStack.addArrangedSubview(specieLabel)
        vStack.addArrangedSubview(genderLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            characterImage.widthAnchor.constraint(equalToConstant: 90),
            characterImage.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
}
