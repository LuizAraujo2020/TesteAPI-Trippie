//
//  TrippieTests.swift
//  TrippieTests
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import XCTest
@testable import Trippie

class ServiceTests: XCTestCase {
    
    var sut: TripService?
    var mock: MockURLSession?
    
    override func setUpWithError() throws {
        mock = MockURLSession()
        sut = TripService(session: mock!)
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testIfReturnData() {
        let expectation = expectation(description: "Returning mocked data correctly")
        let city = "Disney"
        sut?.fetchRequestFromUnsplash(city: city, completion: { result in
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
    
    func testIfDoesNotReturnData() {
        let expectation = expectation(description: "Returning mocked data nil")
        let city = "Disney"
        let expectedError = ServiceUnsplashError.dataNil
        
        mock?.isMeantToFailure = 1
        sut?.fetchRequestFromUnsplash(city: city, completion: { result in
            switch result {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(expectedError, error)
                    XCTAssertEqual(expectedError.errorDescription, error.errorDescription)
                    expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 5)
    }
    
    func testIfDoesFailureParsing() {
        let expectation = expectation(description: "Returning mocked data corrupted")
        let city = "Disney"
        let expectedError = ServiceUnsplashError.parseFailure
        mock?.isMeantToFailure = 2
        sut?.fetchRequestFromUnsplash(city: city, completion: { result in
            switch result {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(expectedError, error)
                    XCTAssertEqual(expectedError.errorDescription, error.errorDescription)
                    expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 5)
    }
    
    func testURLInvalid() {
        let expectation = expectation(description: "URL Nil")
        let city = "Brasília"
        let expectedError = ServiceUnsplashError.urlNil
        sut?.fetchRequestFromUnsplash(city: city, completion: { result in
            switch result {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(expectedError, error)
                    XCTAssertEqual(expectedError.errorDescription, error.errorDescription)
                    expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 5)
    }
    
    class MockURLSession: SessionRequest {
        var mockData: Data? {
            """
            {
                "results": [{
                        "urls": {
                            "full": "https://images.unsplash.com/photo-1625426078245-6911839409dd?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwyNTgwMzN8MHwxfHNlYXJjaHwxfHxicmFzaWxpYXxlbnwwfHx8fDE2NTg0MjU0MTE&ixlib=rb-1.2.1&q=80",
                            "thumb": "https://images.unsplash.com/photo-1625426078245-6911839409dd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTgwMzN8MHwxfHNlYXJjaHwxfHxicmFzaWxpYXxlbnwwfHx8fDE2NTg0MjU0MTE&ixlib=rb-1.2.1&q=80&w=200"
                        }
                    }]
            }
            """.data(using: .utf8)
        }
        
        var mockedErrorData: Data? {
            """
            {
                "asdfsadffasd": [{
                        "urls": {
                            "full": "https://images.unsplash.com/photo-1625426078245-6911839409dd?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwyNTgwMzN8MHwxfHNlYXJjaHwxfHxicmFzaWxpYXxlbnwwfHx8fDE2NTg0MjU0MTE&ixlib=rb-1.2.1&q=80",
                            "thumb": "https://images.unsplash.com/photo-1625426078245-6911839409dd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTgwMzN8MHwxfHNlYXJjaHwxfHxicmFzaWxpYXxlbnwwfHx8fDE2NTg0MjU0MTE&ixlib=rb-1.2.1&q=80&w=200"
                        }
                    }]
            }
            """.data(using: .utf8)
        }
        var isMeantToFailure = 0
        
        func dataTask(with request: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
            switch isMeantToFailure {
                case 0:
                    completionHandler(mockData, nil, nil)
                case 1:
                    completionHandler(nil, nil, nil)
                case 2:
                    completionHandler(mockedErrorData, nil, nil)
                default:
                    break
            }
            return MockURLSessionDataTask()
        }
    }
    
    class MockURLSessionDataTask: URLSessionDataTaskProtocol {
        func resume() { }
    }
}
