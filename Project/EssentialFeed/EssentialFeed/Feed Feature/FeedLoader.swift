//
//  FeedLoader.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 7/27/22
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
