//
//  FeedCache.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/10/22
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
