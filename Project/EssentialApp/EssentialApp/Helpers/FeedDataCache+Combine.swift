//
//  FeedDataCache+Combine.swift
//  EssentialApp
//  
//  Created by Patrick Domingo on 8/17/22
//

import EssentialFeed
import Combine

extension Publisher where Output == [FeedImage] {
    func caching(to cache: FeedCache) -> AnyPublisher<Output, Failure> {
        handleEvents(receiveOutput: cache.saveIgnoringResult).eraseToAnyPublisher()
    }
}

private extension FeedCache {
    func saveIgnoringResult(_ feed: [FeedImage]) {
        save(feed) { _ in }
    }
}
