//
//  CarbonEmissionsView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import SwiftUI

struct CarbonEmissionsView: View {
    
    var carbonEmissions: Double
    var kilometrage: Int
    
    var body: some View {
        VStack {
            Text("Estimated carbon emissions for car kilometrage that equals to \(kilometrage) km:")
                .multilineTextAlignment(.center)
            Text(String(format: "%.1f", carbonEmissions))
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    CarbonEmissionsView(carbonEmissions: 123.43, kilometrage: 500)
}
