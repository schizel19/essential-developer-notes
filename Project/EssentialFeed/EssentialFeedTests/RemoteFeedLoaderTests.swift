//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//  
//  Created by Patrick Domingo on 7/27/22
//

import XCTest


class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL) { }
}

class HTTPClientSpy: HTTPClient {
    var requestURL: URL?
    
    override func get(from url: URL) {
        requestURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
     
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        // Arrange
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        // Act
        sut.load()
        // Assert
        XCTAssertNotNil(client.requestURL)
    }
}
