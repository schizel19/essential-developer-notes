//
//  CoreDataFeedStore.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/4/22
//

import Foundation
import CoreData

public final class CoreDataFeedStore: FeedStore {
   
    public init() {}
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }

    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }

    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
}
