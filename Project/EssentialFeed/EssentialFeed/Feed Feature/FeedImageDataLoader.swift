//
//  FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Patrick Domingo on 8/7/22.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
