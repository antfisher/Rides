//
//  CoordinatorType.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import Foundation

protocol CoordinatorType: AnyObject {
    
    func push(page: AppScreens)
    func pop()
    func popToRoot()
}
