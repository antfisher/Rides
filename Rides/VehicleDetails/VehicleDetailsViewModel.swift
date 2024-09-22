//
//  VehicleDetailsViewModel.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation

extension VehicleDetailsView {
    
    class ViewModel: ObservableObject {
        
        @Published var vehicle: Vehicle
        
        internal init(vehicle: Vehicle) {
            self.vehicle = vehicle
        }
    }
}


