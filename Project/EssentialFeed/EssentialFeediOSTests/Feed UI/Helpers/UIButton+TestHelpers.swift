//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Patrick Domingo on 8/7/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
