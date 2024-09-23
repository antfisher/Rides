//
//  VehicleDetailsView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import SwiftUI

struct VehicleDetailsView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        
        TabView {
            vehicleDetailsView
            carbonEmissionsView
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .navigationTitle("Vehicle Details")
        .navigationBarTitleDisplayMode(.inline)
        
        // I think that it is totally fine to use a TabView here.
        // However, we can also use UIKit UIPageViewController wrapped in a PageView like in the commented code below.
        // In the PageView we are using a PageViewController that is a UIPageViewController represented with a UIViewControllerRepresentable
        
//        PageView(
//            pages: [
//                AnyView(vehicleDetailsView),
//                AnyView(carbonEmissionsView)
//            ]
//        )
//        .navigationTitle("Vehicle Details")
//        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var carbonEmissionsView: some View {
        CarbonEmissionsView(
            carbonEmissions: viewModel.carbonEmissions,
            kilometrage: viewModel.vehicle.kilometrage
        )
    }
    
    @ViewBuilder
    var vehicleDetailsView: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.vehicle.makeAndModel)").font(.title2)
            Text("VIN: \(viewModel.vehicle.vin)")
            Text("Color: \(viewModel.vehicle.color)")
            Text("Type: \(viewModel.vehicle.carType)")
        }
    }
}

#Preview {
    let viewModel = VehicleDetailsView.ViewModel(vehicle: Vehicle.mockedVehicle)
    VehicleDetailsView(viewModel: viewModel)
}
