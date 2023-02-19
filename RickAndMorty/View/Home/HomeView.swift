//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import UIKit

final class HomeView: UIView {
    
    //MARK: - Attributes
    var selectedCharacter: Character?
    var detailsView: DetailsView?
    var homeView: HomeViewController?

    //MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Visual Components
    lazy var tableView: UITableView = {
        let component = UITableView()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.register(
            HomeTableViewCell.self,
            forCellReuseIdentifier: HomeTableViewCell.identifier
        )
        return component
    }()
}

    //MARK: - ViewCodable
extension HomeView: ViewCodableProtocol {
    
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }
}

