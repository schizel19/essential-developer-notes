//
//  FallbackPublisher.swift
//  EssentialApp
//  
//  Created by Patrick Domingo on 8/17/22
//

import Combine

extension Publisher {
    func fallback(to fallbackPublisher: @escaping () -> AnyPublisher<Output, Failure>) -> AnyPublisher<Output, Failure> {
        self.catch { _ in fallbackPublisher() }.eraseToAnyPublisher()
    }
}
