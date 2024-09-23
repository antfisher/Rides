//
//  CoordinatorView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import SwiftUI

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .vehicleList)
                .navigationDestination(for: AppScreens.self) { page in
                    coordinator.build(page: page)
                }
        }
        .tint(.secondary)
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
