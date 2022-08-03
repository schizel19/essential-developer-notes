//
//  FeedLoader.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 7/27/22
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
