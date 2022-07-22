//
//  URLSession+Extension.swift
//  Trippie
//
//  Created by Thiele Oliveira on 17/05/22.
//

import Foundation

extension URLSession: SessionRequest {
    func dataTask(with request: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }  
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
