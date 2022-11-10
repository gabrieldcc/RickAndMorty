//
//  Service.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 03/11/22.
//

import Foundation

class Service {
    
    func makeRequest(completion: @escaping (Character) -> (), url: String) {
        
        let url = "https://rickandmortyapi.com/api"
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            
            guard let responseData = data else { return }
                       	
    
}
