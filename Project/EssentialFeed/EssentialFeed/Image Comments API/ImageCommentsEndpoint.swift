//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/18/22
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(FeedImage)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(image):
            return baseURL.appendingPathComponent("v1/image/\(image.id)/comments")
        }
    }
}
