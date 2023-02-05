//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func show(character: Character)
}

final class HomeViewController: UIViewController {
    
    //MARK: - Attributes
    let containerView = HomeView()
    
    var mainData: MainData?
    var numberOfPages = 1
    weak var delegate: HomeViewControllerDelegate?
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.tableView.delegate = self
        containerView.tableView.dataSource = self
        apiRequest()
        view.backgroundColor = .black
    }
    
    //MARK: - API Request
    private func apiRequest() {
        CharacterAPI.makeRequest { [weak self] mainData in
            guard let self = self else { return }
            self.mainData = mainData
            self.containerView.tableView.reloadData()
        }
    }
}

//MARK: - Tableview Config
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if let character = self.mainData?.results[indexPath.row] {
            delegate?.show(character: character)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = mainData?.results.count ?? 0
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mainData = mainData?.results[indexPath.row],
           let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath) as? HomeTableViewCell {
            
            cell.characterImage.loadFrom(URLAddress: mainData.image)
            cell.nameLabel.text = mainData.name
            cell.statusLabel.text = mainData.status.rawValue
            cell.specieLabel.text = mainData.species.rawValue
            cell.genderLabel.text = mainData.gender.rawValue
            
            cell.nameLabel.textColor = .white
            cell.statusLabel.textColor = .white
            cell.specieLabel.textColor = .white
            cell.genderLabel.textColor = .white
            
            cell.backgroundColor = .black
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return HomeTableViewCell.cellSize
    }
    
}
