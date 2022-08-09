//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//  
//  Created by Patrick Domingo on 8/9/22
//

import Foundation

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
