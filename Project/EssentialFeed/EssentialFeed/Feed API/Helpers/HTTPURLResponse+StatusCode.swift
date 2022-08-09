//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//  
//  Created by Patrick Domingo on 8/9/22
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
