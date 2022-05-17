//
//  HomeViewModel.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import Foundation

class HomeViewModel {
    var service: TripService
    
    init(service: TripService = TripService()) {
        self.service = service
    }
    
    func loadUnsplashData() {
        service.fetchRequestFromUnsplash(city: "Barreiras BA") { response in
            switch response {
                case .success(let unsplash):
                    print(unsplash?.results.first?.urls.full)
                case .failure(let err):
                    print(err)
            }
        }
    }
}
