//
//  HomeViewModel.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import Foundation
import UIKit

protocol TripServiceProtocol {
    
    typealias completionHandler = (Result<Unsplash?, ServiceUnsplashError>) -> Void
    
    func fetchRequestFromUnsplash(city: String, completion: @escaping completionHandler)
}

protocol TripsViewDelegate: AnyObject {
    
    func didReloadData()
    
}

class TripsViewModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let service: TripServiceProtocol
    
    weak var delegate: TripsViewDelegate?
    
    var trips: [Trip] = []
    
    init(service: TripServiceProtocol = TripService()) {
        self.service = service
    }
    
    func loadUnsplashData(city: String, completion: @escaping (Result<String?, ServiceUnsplashError>) -> Void) {
        service.fetchRequestFromUnsplash(city: city) { response in
            switch response {
                case .success(let unsplash):
                    completion(.success(unsplash?.results.first?.urls.thumb))
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
    
    func loadTrips() {
        do {
            let fetch = Trip.fetchRequest()
            
            trips = try context.fetch(fetch)
            
            delegate?.didReloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createNewTrip(city: String) {
        let newTrip = Trip(context: context)
        
        newTrip.city = city
        
        do {
            try context.save()
            
            trips.append(newTrip)
            
            delegate?.didReloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func textIsEmpty(text: String?) -> Bool {
        guard let text = text else { return true }
        
        let trimmingWhitespaces = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmingWhitespaces.isEmpty
    }
}
