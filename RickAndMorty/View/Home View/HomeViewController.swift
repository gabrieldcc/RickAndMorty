//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 01/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Let
    let containerView = HomeView()
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.delegate = self
    }
    
}
//MARK: - Navigation
extension HomeViewController: HomeViewDelegate {
    func showDetails() {
        let controller = DetailsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}











