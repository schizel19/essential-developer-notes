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
