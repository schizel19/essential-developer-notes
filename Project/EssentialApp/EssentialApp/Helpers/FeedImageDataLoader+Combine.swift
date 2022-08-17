//
//  FeedImageDataLoader+Combine.swift
//  EssentialApp
//  
//  Created by Patrick Domingo on 8/17/22
//

import Foundation
import EssentialFeed
import Combine

public extension FeedImageDataLoader {
    typealias Publisher = AnyPublisher<Data, Error>
    
    func loadImageDataPublisher(from url: URL) -> Publisher {
        var task: FeedImageDataLoaderTask?
        
        return Deferred {
            Future { completion in
                task = self.loadImageData(from: url, completion: completion)
            }
        }
        .handleEvents(receiveCancel: { task?.cancel() })
        .eraseToAnyPublisher()
    }
}
