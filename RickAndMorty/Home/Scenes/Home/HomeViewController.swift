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
    var currentPage = 1
    weak var delegate: HomeViewControllerDelegate?
    let repository = HomeRepository()
    
    //MARK: - View Lifecycle
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupTableView()
        apiRequest()
    }

    //MARK: - API Request
    private func apiRequest() {
        repository.makeRequest(nextPage: currentPage) {
            [weak self] mainData in
            guard let self = self else { return }
            if self.mainData?.results == nil {
                self.mainData = mainData
            } else {
                self.mainData?.results += mainData.results
            }
            self.containerView.tableView.reloadData()
        }
    }
}

    //MARK: - Tableview Config
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        containerView.tableView.delegate = self
        containerView.tableView.dataSource = self
        containerView.tableView.backgroundColor = .black
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        if let character = self.mainData?.results[indexPath.row] {
            delegate?.show(character: character)
        }
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = mainData?.results.count ?? 0
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let mainData = mainData?.results[indexPath.row],
              let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeTableViewCell.identifier,
                for: indexPath) as? HomeTableViewCell else {
                    return UITableViewCell()
                }
        
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
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeTableViewCell.cellSize
    }
    
    func tableView(_ tableView: UITableView,willDisplay cell: UITableViewCell,forRowAt indexPath: IndexPath) {
        let isCurrentPageLowerThanPages =
        currentPage <= mainData?.info.pages ?? 0
        let isLatestItem =
        indexPath.row == (mainData?.results.count ?? 0) - 2
        if isLatestItem && isCurrentPageLowerThanPages {
            apiRequest()
            currentPage += 1
        }
    }
}

