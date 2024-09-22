//
//  VehicleListView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import SwiftUI

struct VehicleListView: View {
    
    private enum Field: Int, CaseIterable {
        case numberInput
    }
    
    @StateObject var viewModel: ViewModel
    @FocusState private var focusedField: Field?
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            // TextInput and Button
            HStack(alignment: .center, spacing: 10) {
                TextField("Enter number of vehicles", text: $viewModel.numberOfVehicles)
                    .focused($focusedField, equals: .numberInput)
                    .keyboardType(.numberPad)
                    .padding(14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(viewModel.inputIsValid ? Color.green : Color.gray, lineWidth: 2)
                    )
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Done") {
                                focusedField = nil
                            }
                            .foregroundStyle(.secondary)
                            .frame(alignment: .trailing )
                        }
                    }
                Button {
                    Task {
                        isLoading = true
                        await viewModel.getVehicles()
                        isLoading = false
                    }
                    focusedField = nil
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
            // Sorting and ordering
            SortingView(sorting: $viewModel.sorting)
            // Vehicle list
            List($viewModel.vehicles) { vehicle in
                VehicleListItemView(vehicle: vehicle.wrappedValue)
                    .onTapGesture {
                        viewModel.showDetails(vehicle.wrappedValue)
                    }
            }
            .scrollContentBackground(.hidden)
            .background(.ultraThinMaterial)
            // Empty view and loader
            .overlay(Group {
                if viewModel.vehicles.isEmpty && !isLoading {
                    Text("Enter a number and press 'Get Vehicles' to see the list.")
                        .multilineTextAlignment(.center)
                }
                
                if isLoading {
                    HStack(spacing: 15) {
                        ProgressView()
                            .tint(.primary)
                        Text("Loading…")
                    }
                    
                }
            })
            
            Spacer()
            
        }
        .navigationTitle("Vehicle List")
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    VehicleListView(viewModel: .init(coordinator: Coordinator.init()))
}
