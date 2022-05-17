//
//  TripModel.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import Foundation

struct Unsplash: Codable {
    let results: [Results]
}

struct Results: Codable {
    let urls: UrlImage
}

struct UrlImage: Codable {
    let full: String
    let thumb: String
}
