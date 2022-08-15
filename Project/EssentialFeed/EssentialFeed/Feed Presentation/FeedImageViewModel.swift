//
//  FeedImageViewModel.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/9/22
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
