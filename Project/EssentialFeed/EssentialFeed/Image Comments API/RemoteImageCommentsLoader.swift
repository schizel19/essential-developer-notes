//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/12/22
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
