//
//  Paginated+Combine.swift
//  EssentialApp
//  
//  Created by Patrick Domingo on 8/22/22
//

import Combine
import EssentialFeed

public extension Paginated {
    var loadMorePublisher: (() -> AnyPublisher<Self, Error>)? {
        guard let loadMore = loadMore else { return nil }

        return {
            Deferred {
                Future(loadMore)
            }.eraseToAnyPublisher()
        }
    }
}
