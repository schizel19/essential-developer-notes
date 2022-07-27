//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//  
//  Created by Patrick Domingo on 7/27/22
//

import XCTest


class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    private init() {}
    var requestURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
     
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        // Arrange
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        // Act
        sut.load()
        // Assert
        XCTAssertNotNil(client.requestURL)
    }
}
