//
//  VehicleListView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import SwiftUI

struct VehicleListView: View {
   
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            // TextInput and Button
            HStack(alignment: .center, spacing: 10) {
                TextField("Enter number of vehicles", text: $viewModel.numberOfVehicles)
                    .keyboardType(.numberPad)
                    .padding(14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(viewModel.inputIsValid ? Color.green : Color.gray, lineWidth: 2)
                    )
                Button {
                    viewModel.getVehicles()
                } label: {
                    Text("Get Vehicles")
                }
                // Disable button when input value is not valid (not a number)
                .disabled(!viewModel.inputIsValid)
                .opacity(viewModel.inputIsValid ? 1 : 0.5)
                .padding(16)
                .foregroundStyle(.white)
                .background(Color.green)
                .cornerRadius(8)
            }
            .padding()
            // Vehicle list
            List($viewModel.vehicles) { vehicle in
                VehicleListItemView(vehicle: vehicle.wrappedValue)
                .onTapGesture {
                    viewModel.showDetails(vehicle.wrappedValue)
                }
            }
            .scrollContentBackground(.hidden)
            .background(.ultraThinMaterial)
            
            Spacer()
            
        }
        .navigationTitle("Vehicle List")
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    VehicleListView(viewModel: .init(coordinator: Coordinator.init()))
}
