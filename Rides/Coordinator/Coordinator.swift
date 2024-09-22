//
//  Coordinator.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import Foundation
import SwiftUI

class Coordinator: CoordinatorType, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    private let factory: VehicleViewFactoryType
    
    init(factory: VehicleViewFactoryType = VehicleViewFactory()) {
        self.factory = factory
    }
    
    func push(page: AppScreens) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: AppScreens) -> some View {
        switch page {
        case .vehicleList:
            factory.buildVehicleListView(coordinator: self)
        case .vehicleDetails(let vehicle):
            factory.buildVehicleDetailsView(vehicle: vehicle)
        }
    }
    
    private func buildVehicleListView() -> some View {
        let viewModel = VehicleListView.ViewModel(coordinator: self)
        return VehicleListView(viewModel: viewModel)
    }
    
    private func buildVehicleDetailsView(vehicle: Vehicle) -> some View {
        let viewModel = VehicleDetailsView.ViewModel(vehicle: vehicle)
        return VehicleDetailsView(viewModel: viewModel)
    }
}
