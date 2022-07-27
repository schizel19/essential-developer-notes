//
//  FeedLoader.swift
//  Modular
//  
//  Created by Patrick Domingo on 7/27/22
//

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
