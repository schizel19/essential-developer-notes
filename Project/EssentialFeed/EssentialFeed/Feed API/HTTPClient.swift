//
//  HTTPClient.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/1/22
//

import Foundation

public protocol HTTPClient {
    
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate thread, if needed.
    func get(from url: URL, completion: @escaping (Result) -> Void)
}
