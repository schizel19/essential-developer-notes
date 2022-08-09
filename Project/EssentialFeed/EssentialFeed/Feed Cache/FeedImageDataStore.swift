//
//  FeedImageDataStore.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/10/22
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
