//
//  VehicleViewFactory.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import SwiftUI

class VehicleViewFactory: VehicleViewFactoryType {
    
    private let networkService: VehicleNetworkServiceType = VehicleNetworkService()
    
    func buildVehicleListView(coordinator: any CoordinatorType) -> AnyView {
        let viewModel = VehicleListView.ViewModel(coordinator: coordinator, networkService: networkService)
        return AnyView(VehicleListView(viewModel: viewModel))
    }
    
    func buildVehicleDetailsView(vehicle: Vehicle) -> AnyView {
        let viewModel = VehicleDetailsView.ViewModel(vehicle: vehicle)
        return AnyView(VehicleDetailsView(viewModel: viewModel))
    }
}
