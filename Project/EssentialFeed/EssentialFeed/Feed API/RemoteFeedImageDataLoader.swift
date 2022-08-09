//
//  RemoteFeedImageDataLoader.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/9/22
//

import Foundation

public class RemoteFeedImageDataLoader: FeedImageDataLoader {
    let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    private struct HTTPTaskWrapper: FeedImageDataLoaderTask {
        let wrapped: HTTPClientTask

        func cancel() {
            wrapped.cancel()
        }
    }
    
    @discardableResult
    public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return HTTPTaskWrapper(wrapped: client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success((data, response)):
                if response.statusCode == 200, !data.isEmpty {
                    completion(.success(data))
                } else {
                    completion(.failure(Error.invalidData))
                }
            case let .failure(error): completion(.failure(error))
            }
        })
    }
    
    public enum Error: Swift.Error {
        case invalidData
    }
}
