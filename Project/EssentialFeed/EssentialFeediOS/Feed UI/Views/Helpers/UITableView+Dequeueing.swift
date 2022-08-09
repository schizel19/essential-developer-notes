//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//  
//  Created by Patrick Domingo on 8/8/22
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
