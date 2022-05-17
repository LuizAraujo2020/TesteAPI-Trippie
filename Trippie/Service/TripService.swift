//
//  TripService.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import Foundation

protocol SessionRequest {
    func dataTask(with request: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class TripService {
    private let key = "MhhlHI6wOceOY7nYiKoAwqZgUVtuw_IFdxrBE8BOEM0"
    var session: SessionRequest
    
    typealias completionHandler = (Result<Unsplash?, Error>) -> Void
    
    init(session: SessionRequest = URLSession.shared) {
        self.session = session
    }
    
    func fetchRequestFromUnsplash(city: String, completion: @escaping completionHandler) {
        let urlUnsplash = "https://api.unsplash.com/search/photos/?query=\(city)&per_page=1&client_id=\(self.key)"
        guard let url = URL(string: urlUnsplash) else {
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Unsplash.self, from: data)
                completion(.success(decodedData))
            } catch let err{
                completion(.failure(err))
            }

        }.resume()
    }
}

extension URLSession: SessionRequest { }
