//
//  LocalFeedLoader+Combine.swift
//  EssentialApp
//  
//  Created by Patrick Domingo on 8/17/22
//

import EssentialFeed
import Combine

public extension LocalFeedLoader {
    typealias Publisher = AnyPublisher<[FeedImage], Error>
    
    func loadPublisher() -> Publisher {
        return Deferred {
            Future(self.load)
        }
        .eraseToAnyPublisher()
    }
}
