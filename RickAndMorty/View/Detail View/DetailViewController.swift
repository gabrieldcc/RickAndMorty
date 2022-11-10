//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 10/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Let
    let containerView = DetailView()
    var mainData: MainData?
    
    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
