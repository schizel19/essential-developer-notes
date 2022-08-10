//
//  SharedTestHelpers.swift
//  EssentialAppTests
//  
//  Created by Patrick Domingo on 8/10/22
//

import Foundation
import XCTest
import EssentialFeed

extension XCTestCase {
    func anyData() -> Data {
        return Data("any data".utf8)
    }

    func anyURL() -> URL {
        return URL(string: "http://a-url.com")!
    }

    func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
    
    func uniqueFeed() -> [FeedImage] {
        return [FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())]
    }
    
}
