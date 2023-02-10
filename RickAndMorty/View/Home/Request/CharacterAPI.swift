//
//  CharacterAPI.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import Foundation

final class CharacterAPI {
    
    func makeRequest(
        nextPage: Int,
        completion: @escaping (MainData) -> ()) {
            let endpoint = "https://rickandmortyapi.com/api/character?page=\(nextPage)"
            guard let url = URL(string: endpoint) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { [ self ]
                (data, response, error) in
                self.responseHandler(response)
                self.errorHandler(error)
                self.dataHandler(data) { result in
                    completion(result)
                }
            }
            task.resume()
        }
    
    fileprivate func responseHandler(_ response: URLResponse?) {
        print("response: \(String(describing: response))")
    }
    
    fileprivate func errorHandler(_ error: Error?) {
        print("error to receive data: \(String(describing: error))")
    }
    
    fileprivate func dataHandler(_ data: Data?, completion: @escaping (MainData) -> ()) {
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
}
