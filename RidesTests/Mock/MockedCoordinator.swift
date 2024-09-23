//
//  MockedCoordinator.swift
//  RidesTests
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import Foundation
@testable import Rides

class MockedCoordinator: CoordinatorType {
    func push(page: Rides.AppScreens) { }
    
    func pop() { }
    
    func popToRoot() { }
}
