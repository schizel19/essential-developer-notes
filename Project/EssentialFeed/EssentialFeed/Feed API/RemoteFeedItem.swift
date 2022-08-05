//
//  RemoteFeedItem.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/3/22
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
