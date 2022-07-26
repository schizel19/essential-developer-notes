//
//  ApiClient.swift
//  RequirementAnalysis
//
//  Created by Patrick Domingo on 7/26/22.
//

import Foundation

class ApiClient {
    
    static let instance = ApiClient()
    private init() {}
    
    static func getInstance() -> ApiClient {
        return instance
    }
}

let client = ApiClient.getInstance()
