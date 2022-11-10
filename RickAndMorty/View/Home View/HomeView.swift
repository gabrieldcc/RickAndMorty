//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 01/11/22.
//

import UIKit

final class HomeView: UIView {
    
    var mainData: MainData?
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupView()
        apiRequest()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apiRequest() {
       CharacterAPI.makeRequest { [weak self] mainData in
           guard let self = self else { return }
           self.mainData = mainData
           self.tableView.reloadData()
       }
    }
    

    
    //MARK: - Visual Components
    private lazy var tableView: UITableView = {
        let component = UITableView()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.dataSource = self
        component.delegate = self
        component.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        return component
    }()

}



    //MARK: - TableView
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = mainData?.results.count ?? 0
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
        
        let mainData = mainData?.results[indexPath.row]
        
        cell.characterImage.loadFrom(URLAddress: mainData?.image ?? String())
        cell.nameLabel.text = mainData?.name
        cell.statusLabel.text = mainData?.status.rawValue
        cell.specieLabel.text = mainData?.species.rawValue
        cell.genderLabel.text = mainData?.gender.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return HomeTableViewCell.cellSize
        }
    
}

    //MARK: - ViewCodable
extension HomeView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}
