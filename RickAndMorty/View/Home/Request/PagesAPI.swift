//
//  PagesAPI.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import Foundation

class PagesAPI {
    
    class func makeRequest(completion: @escaping (MainData) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("response: \(String(describing: response))")
            print("error to receive data: \(String(describing: error))")
            guard let responseData = data else { return }
            DispatchQueue.main.async {
            do {
                let result = try JSONDecoder().decode(MainData.self, from: responseData)
                completion(result)
            } catch let error {
                print("error to call: \(error)")
            }
        }
    }
        task.resume()
    }
}
