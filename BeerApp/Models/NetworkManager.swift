//
//  NetworkManager.swift
//  BeerApp
//
//  Created by Сергей Иванов on 10.04.2022.
//

import Foundation
 
class NetworkManager {

    static func fetchBeerInfo(url: String, completion: @escaping (_ beerInfo: [BeerInfo])->()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let beerInfo = try JSONDecoder().decode([BeerInfo].self, from: data)
                completion(beerInfo)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
