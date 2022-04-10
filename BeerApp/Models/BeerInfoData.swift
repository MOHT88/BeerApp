//
//  BeerInfo.swift
//  BeerApp
//
//  Created by Сергей Иванов on 08.04.2022.
//

import Foundation

struct BeerInfo: Decodable {
    let name: String
    let description: String
    let image_url: String
}
