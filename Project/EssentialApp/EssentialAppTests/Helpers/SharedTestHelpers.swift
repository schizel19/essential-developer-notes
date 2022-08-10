//
//  SharedTestHelpers.swift
//  EssentialAppTests
//  
//  Created by Patrick Domingo on 8/10/22
//

import Foundation
import XCTest

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
}

