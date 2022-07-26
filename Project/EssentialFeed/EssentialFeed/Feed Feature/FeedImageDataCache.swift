//
//  FeedImageDataCache.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/11/22
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
