//
//  MainQueueDispatchDecorator.swift
//  EssentialFeediOS
//  
//  Created by Patrick Domingo on 8/8/22
//

import Foundation

final class MainQueueDispatchDecorator<T> {
    let decoratee: T
    
    init(decoratee: T) {
        self.decoratee = decoratee
    }
    
    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async(execute: completion)
        }

        completion()
    }
}
