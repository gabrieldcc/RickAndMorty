//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func show(from: UIViewController, character: Character)
}

final class HomeViewController: UIViewController {
    
    var mainData: MainData?
    var numberOfPages = 1
    private let router: HomeViewControllerProtocol = HomeViewRouter()
    
    //MARK: - Let
    let containerView = HomeView()
    
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let pages = mainData?.info.pages else { return }
        if pages > numberOfPages {
            numberOfPages += 1
            apiRequest()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let character = self.mainData?.results[indexPath.row] else { return }
        router.show(from: self, character: character)
    }
    
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
        
        cell.nameLabel.textColor = .white
        cell.statusLabel.textColor = .white
        cell.specieLabel.textColor = .white
        cell.genderLabel.textColor = .white
        
        cell.backgroundColor = .black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return HomeTableViewCell.cellSize
    }
    
}