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
        @Published var carbonEmissions: Double = 0
        
        internal init(vehicle: Vehicle) {
            self.vehicle = vehicle
            self.carbonEmissions = calculateCarbonEmissions(kilometrage: vehicle.kilometrage)
        }
        
        /// For the first 5000km travelled, 1 unit of carbon is emitted per kilometre.
        /// After the first 5000km travelled, 1.5 units is emitted per kilometre.
        private func calculateCarbonEmissions(kilometrage: Int) -> Double {
            guard kilometrage > 0 else { return 0 } // kilometrage shouldn't be less than 0
            let firstRateLimit = 5000
            let firstRate = 1.0
            let secondRate = 1.5
            
            if kilometrage <= firstRateLimit {
                return Double(kilometrage) * firstRate
            } else {
                let firstPart = Double(firstRateLimit) * firstRate
                let secondPart = Double(kilometrage - firstRateLimit) * secondRate
                return firstPart + secondPart
            }
        }
    }
}
