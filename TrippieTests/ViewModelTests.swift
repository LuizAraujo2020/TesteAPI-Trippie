//
//  ViewModelTests.swift
//  TrippieTests
//
//  Created by Gabriel do Prado Moreira on 21/07/22.
//

import XCTest
@testable import Trippie

class ViewModelTests: XCTestCase {
    
    var sut: HomeViewModel?
    var service: TripServiceMock?
    override func setUpWithError() throws {
        try super.setUpWithError()
        service = TripServiceMock()
        sut = HomeViewModel(service: service!)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        service = nil
        try super.tearDownWithError()
    }
    
    func testIfLoadUnsplashDataWithSuccess() {
        let expectation = expectation(description: "Loaded Data With Success")

        sut?.loadUnsplashData(completion: { result in
            switch result {
                case .success(let data):
                    XCTAssertNotNil(data)
                    expectation.fulfill()
                case .failure(_):
                    XCTFail()
            }
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testIfLoadUnsplashDataWithError() {
        let expectation = expectation(description: "Loaded Data With Error")
        
        service?.isMeantToFailure = true
        
        sut?.loadUnsplashData(completion: { result in
            switch result {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertNotNil(error)
                    expectation.fulfill()
            }
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    class TripServiceMock: TripServiceProtocol {
        var isMeantToFailure = false
        var mockData = Unsplash(results: [Results(urls: UrlImage(full: "", thumb: ""))])
        
        func fetchRequestFromUnsplash(city: String, completion: @escaping completionHandler) {
            if !isMeantToFailure {
                completion(.success(mockData))
            } else {
                completion(.failure(ServiceUnsplashError.parseFailure))
            }
        }
    }
}
