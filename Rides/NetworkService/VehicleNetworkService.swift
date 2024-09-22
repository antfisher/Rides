//
//  VehicleNetworkService.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation

protocol VehicleNetworkServiceType {
    func getVehiclesList(size: Int) async throws -> [Vehicle]
}

struct VehicleNetworkService {
    
    enum VehicleEndpoints: EndpointProvider {
        
        case vehiclesList(size: Int)
        
        var path: String {
            return "/api/vehicle/random_vehicle"
        }
        
        var method: RequestMethod {
            return .get
        }
        
        var token: String? {
            return nil
        }
        
        var queryItems: [URLQueryItem]? {
            switch self {
            case .vehiclesList(let size):
                return [URLQueryItem(name: "size", value: "\(size)")]
            }
        }
        
        var body: [String : Any]? { return nil }
    }
}

extension VehicleNetworkService: VehicleNetworkServiceType {
    
    func getVehiclesList(size: Int) async throws -> [Vehicle] {
        try await ApiClient.shared.asyncRequest(endpoint: VehicleEndpoints.vehiclesList(size: size))
    }
}
