//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation
import Combine

extension VehicleListView {
    
    class ViewModel: ObservableObject {
        
        private weak var coordinator: CoordinatorType?
        
        private var cancellables: Set<AnyCancellable> = []
        private let networkService: VehicleNetworkServiceType
        
        @Published var numberOfVehicles: String = ""
        @Published var inputIsValid: Bool = false
        @Published var vehicles: [Vehicle] = []
        
        private var size: Int {
            Int(numberOfVehicles) ?? 0
        }
        
        init(coordinator: CoordinatorType, networkService: VehicleNetworkServiceType = VehicleNetworkService()) {
            
            self.coordinator = coordinator
            self.networkService = networkService
            
            $numberOfVehicles
                .removeDuplicates()
                .dropFirst()
                .sink { [weak self] sizeString in
                    guard let self else { return }
                    self.inputIsValid = self.validateSize(sizeString: sizeString)
            }
            .store(in: &cancellables)
        }
        
        func showDetails(_ vehicle: Vehicle) {
            coordinator?.push(page: .vehicleDetails(vehicle: vehicle))
        }
        
        @MainActor
        func getVehicles() {
            Task {
                do {
                    vehicles = try await networkService.getVehiclesList(size: size).sorted(by: { $0.vin < $1.vin })
                    numberOfVehicles = ""
                } catch let error as ApiError {
                    print(error.message)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        private func validateSize(sizeString: String) -> Bool {
            
            // Check if the stringValue is not empty
            guard !sizeString.isEmpty else {
                return false
            }
            // Check if the stringValue can be casted to Int
            guard Int(sizeString) != nil else {
                return false
            }

            return true
        }
    }
}
