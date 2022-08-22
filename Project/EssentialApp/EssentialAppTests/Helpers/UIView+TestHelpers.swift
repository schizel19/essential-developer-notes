//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//  
//  Created by Patrick Domingo on 8/22/22
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
