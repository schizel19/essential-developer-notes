//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//  
//  Created by Patrick Domingo on 8/9/22
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
