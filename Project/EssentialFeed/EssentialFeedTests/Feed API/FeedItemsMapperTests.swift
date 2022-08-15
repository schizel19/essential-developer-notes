//
//  FeedItemsMapperTests.swift
//  EssentialFeedTests
//  
//  Created by Patrick Domingo on 7/27/22
//

import XCTest
import Foundation
import EssentialFeed

class FeedItemsMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let json = makeItemsJSON([])
        let samples = [199, 201, 300, 400, 500]

        try samples.forEach { code in
            XCTAssertThrowsError(
                try FeedItemsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() throws {
        let invalidJSON = Data("invalid json".utf8)
        XCTAssertThrowsError(
            try FeedItemsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func test_map_deliversNoItemsOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])
        let result = try FeedItemsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: 200))
        XCTAssertEqual(result, [])
    }
    
    func test_map_deliversItemsOn200HTTPResponseWithJSONItems() throws {
        let item1 = makeItem(
            id: UUID(),
            imageUrl: URL(string: "http://a-url.com")!)
        let item2 = makeItem(
            id: UUID(),
            description: "a description",
            location: "a location",
            imageUrl: URL(string: "http://another-url.com")!)
        
        let itemsJson = makeItemsJSON([item1.json, item2.json])
        
        let result = try FeedItemsMapper.map(itemsJson, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, [item1.model, item2.model])
    }

    // MARK: - Helpers
    
    private func makeItem(id: UUID  , description: String? = nil, location: String? = nil, imageUrl: URL) -> (model: FeedImage, json: [String: Any]) {
        let item = FeedImage(id: id, description: description, location: location, url: imageUrl)
        let json = [
            "id": id.uuidString  ,
            "description": description,
            "location": location,
            "image": imageUrl.absoluteString
        ].compactMapValues { $0 } // remove optional items
        
        return (item, json)
    }
}
