//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 10/11/22.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Var
    var character: Character?
    
    //MARK: - Let
    private let containerView = DetailsView()
    
    //MARK: - Init

    //MARK: -  View Lifecycle
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.nameDinamicLabel.text = character?.name
        containerView.genderDinamicLabel.text = character?.gender.rawValue
    }

    
}
