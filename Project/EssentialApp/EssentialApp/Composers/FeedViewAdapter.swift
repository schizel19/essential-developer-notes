//
//  FeedViewAdapter.swift
//  EssentialFeedApp
//  
//  Created by Patrick Domingo on 8/8/22
//

import EssentialFeed
import EssentialFeediOS
import UIKit

final class FeedViewAdapter: FeedView {
    private weak var controller: FeedViewController?
    private let imageLoader: (URL) -> FeedImageDataLoader.Publisher
    
    init(controller: FeedViewController, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.display(viewModel.feed.map({ model in
            let adapter = FeedImageDataLoaderPresentationAdapter<WeakRefVirtualProxy<FeedImageCellController>, UIImage>(model: model, imageLoader: imageLoader)
            
            let view = FeedImageCellController(delegate: adapter)

            adapter.presenter = FeedImagePresenter(view: WeakRefVirtualProxy(view), imageTransformer: UIImage.init)
            
            return view
        }))
    }
}
