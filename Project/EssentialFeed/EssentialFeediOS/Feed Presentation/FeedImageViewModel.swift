//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Patrick Domingo on 8/7/22.
//


struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
