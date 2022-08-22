//
//  FeedPresenter.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/9/22
//

import Foundation

public final class FeedPresenter {    
    public static var title: String {
        return NSLocalizedString(
            "FEED_VIEW_TITLE",
            tableName: "Feed",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Title for the feed view")
    }
}
