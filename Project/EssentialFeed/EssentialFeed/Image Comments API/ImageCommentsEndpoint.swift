//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/18/22
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(uuid):
            return baseURL.appendingPathComponent("v1/image/\(uuid.uuidString)/comments")
        }
    }
}
