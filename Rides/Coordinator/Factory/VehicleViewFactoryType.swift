//
//  VehicleViewFactoryType.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import SwiftUI

protocol VehicleViewFactoryType {
    
    func buildVehicleListView(coordinator: CoordinatorType) -> AnyView
    func buildVehicleDetailsView(vehicle: Vehicle) -> AnyView
}
