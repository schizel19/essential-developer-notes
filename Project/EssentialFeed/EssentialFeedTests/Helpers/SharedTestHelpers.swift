//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//  
//  Created by Patrick Domingo on 8/3/22
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data( "any data".utf8)
}

func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    return try! JSONSerialization.data(withJSONObject: ["items": items])
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
