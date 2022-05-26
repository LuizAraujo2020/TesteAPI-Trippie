//
//  TripModel.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import Foundation

struct Unsplash: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let urls: UrlImage
}

struct UrlImage: Decodable {
    let full: String
    let thumb: String
}
