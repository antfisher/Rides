//
//  AppScreens.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import Foundation

enum AppScreens: Hashable {
    
    case vehicleList
    case vehicleDetails(vehicle: Vehicle)
}

extension AppScreens: Equatable {
    
    static func == (lhs: AppScreens, rhs: AppScreens) -> Bool {
        switch (lhs, rhs) {
        case (.vehicleList, .vehicleList):
            return true
        case (.vehicleDetails(let l), .vehicleDetails(let r)):
            return l == r
        default:
            return false
        }
    }
}
