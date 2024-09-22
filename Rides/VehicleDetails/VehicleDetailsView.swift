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
        
        VStack(spacing: 10) {
            Text("\(viewModel.vehicle.makeAndModel)").font(.title2)
            Text("VIN: \(viewModel.vehicle.vin)")
            Text("Color: \(viewModel.vehicle.color)")
            Text("Type: \(viewModel.vehicle.carType)")
        }
        .padding(40)
        .cornerRadius(6)
        .navigationTitle("Vehicle Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let viewModel = VehicleDetailsView.ViewModel(vehicle: Vehicle.mockedVehicle)
    VehicleDetailsView(viewModel: viewModel)
}
