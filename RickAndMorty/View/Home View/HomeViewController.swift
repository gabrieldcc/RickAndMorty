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
    var mainData: MainData?

    
    //MARK: - Lifecycle View
    override func loadView() {
        self.view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            apiRequest()
        print("teste \(mainData)")
    }
    
    
    //MARK: - API Call
    func apiRequest() {
       CharacterAPI.makeRequest { [weak self] mainData in
           self?.mainData = mainData
           
       }
    }
    
    }
    

    








