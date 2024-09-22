//
//  API.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation

struct API {
    
    static func setup() {
        
        // Change URLSessionConfiguration to define desired behavior for an URLSession
        let configuration = URLSessionConfiguration.default
        configuration.networkServiceType = .default
        configuration.allowsCellularAccess = true
        configuration.requestCachePolicy = .useProtocolCachePolicy
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 300
        
        ApiClient.shared = ApiClient(configuration: configuration)
    }
}
