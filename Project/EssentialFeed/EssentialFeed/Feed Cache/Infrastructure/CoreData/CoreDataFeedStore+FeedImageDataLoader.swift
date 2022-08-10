//
//  CoreDataFeedStore+FeedImageDataLoader.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/10/22
//

import Foundation


extension CoreDataFeedStore: FeedImageDataStore {

    public func insert(_ data: Data, for url: URL, completion: @escaping (FeedImageDataStore.InsertionResult) -> Void) {

    }

    public func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        completion(.success(.none))
    }

}
