//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/15/22
//

import Foundation

public final class ImageCommentsPresenter {
    
    public static var title: String {
        return NSLocalizedString(
            "IMAGE_COMMENTS_VIEW_TITLE",
            tableName: "ImageComments",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Title for the image comments view")
    }
}
