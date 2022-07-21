//
//  HomeViewModel.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import Foundation

protocol TripServiceProtocol {
    typealias completionHandler = (Result<Unsplash?, ServiceUnsplashError>) -> Void
    func fetchRequestFromUnsplash(city: String, completion: @escaping completionHandler)
}

class HomeViewModel {
    var service: TripServiceProtocol
    
    init(service: TripServiceProtocol = TripService()) {
        self.service = service
    }
    
    func loadUnsplashData(completion: @escaping (Result<String?, ServiceUnsplashError>) -> Void) {
        service.fetchRequestFromUnsplash(city: "Barreiras") { response in
            switch response {
                case .success(let unsplash):
                    completion(.success(unsplash?.results.first?.urls.full))
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
}
