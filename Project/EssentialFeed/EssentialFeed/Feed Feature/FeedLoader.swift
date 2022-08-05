//
//  FeedLoader.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 7/27/22
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
