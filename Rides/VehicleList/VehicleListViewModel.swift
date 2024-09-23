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
        @Published var inputError: String?
        @Published var vehicles: [Vehicle] = []
        @Published var sorting = Sorting.default
        
        private var size: Int {
            Int(numberOfVehicles) ?? 0
        }
        
        init(coordinator: CoordinatorType, networkService: VehicleNetworkServiceType = VehicleNetworkService()) {
            
            self.coordinator = coordinator
            self.networkService = networkService
            
            // Input validation
            $numberOfVehicles
                .removeDuplicates()
                .dropFirst()
                .sink { [weak self] sizeString in
                    guard let self else { return }
                    self.inputIsValid = self.validateSize(sizeString: sizeString)
                }
                .store(in: &cancellables)
            
            $sorting
                .removeDuplicates()
                .dropFirst()
                .sink { [weak self] sorting in
                    guard let self else { return }
                    self.vehicles = sort(vehicles: self.vehicles, sorting: sorting)
                }
                .store(in: &cancellables)
        }
        
        func showDetails(_ vehicle: Vehicle) {
            coordinator?.push(page: .vehicleDetails(vehicle: vehicle))
        }
        
        @MainActor
        func getVehicles() async {
                do {
                    let vehicles = try await networkService.getVehiclesList(size: size)
                    self.vehicles = sort(vehicles: vehicles, sorting: sorting)
                    numberOfVehicles = ""
                } catch let error as ApiError {
                    print(error.message)
                } catch {
                    print(error.localizedDescription)
                }
        }
        
        private func validateSize(sizeString: String) -> Bool {
            
            // Check if the stringValue is not empty
            guard !sizeString.isEmpty else {
                inputError = nil
                return false
            }
            // Check if the stringValue can be casted to Int
            guard let size = Int(sizeString) else {
                inputError = "Enter a valid number"
                return false
            }
            
            guard size <= 100 else {
                inputError = "Size must be less than or equal to 100"
                return false
            }
            
            guard size >= 1 else {
                inputError = "Size must be at least 1"
                return false
            }
            
            inputError = nil
            return true
        }
        
        private func sort(vehicles: [Vehicle], sorting: Sorting) -> [Vehicle] {
        
            switch sorting.parameter {
            case .vin:
                vehicles.sorted { $0.vin.compare($1.vin) == sorting.order.comparison}
            case .carType:
                vehicles.sorted { $0.carType.compare($1.carType) == sorting.order.comparison}
            }
        }
    }
}
