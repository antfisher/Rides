//
//  VehicleListItemView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import SwiftUI

struct VehicleListItemView: View {
    
    let vehicle: Vehicle
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(vehicle.makeAndModel)
                Text(vehicle.vin)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(6)
        
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    VehicleListItemView(vehicle: Vehicle.mockedVehicle)
}

#Preview {
    VehicleListItemView(vehicle: Vehicle.mockedVehicle)
}
