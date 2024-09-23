//
//  VehicleDetailsTests.swift
//  RidesTests
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import XCTest
@testable import Rides

final class VehicleDetailsTests: XCTestCase {
    
    func testCarbonEmissionsUnder5000() {
        let viewModel = VehicleDetailsView.ViewModel(vehicle: Vehicle.threeThousandKilometrageVehicle)
        let emissions = viewModel.carbonEmissions
        XCTAssertEqual(emissions, 3000.0, "Emissions for 3000km should be 3000 units")
    }
    
    func testCarbonEmissionsExactly5000() {
        let viewModel = VehicleDetailsView.ViewModel(vehicle: Vehicle.fiveThousandKilometrageVehicle)
        let emissions = viewModel.carbonEmissions
        XCTAssertEqual(emissions, 5000.0, "Emissions for 5000km should be 5000 units")
    }

    func testCarbonEmissionsOver5000() {
        let viewModel = VehicleDetailsView.ViewModel(vehicle: Vehicle.sevenThousandKilometrageVehicle)
        let emissions = viewModel.carbonEmissions
        XCTAssertEqual(emissions, 8000.0, "Emissions for 7000km should be 8000 units (5000 * 1 + 2000 * 1.5)")
    }
    
    func testCarbonEmissionsNegativeKilometrage() {
        let viewModel = VehicleDetailsView.ViewModel(vehicle: Vehicle.negativeKilometrageVehicle)
        let emissions = viewModel.carbonEmissions
        XCTAssertEqual(emissions, 0, "Emissions for negative km should be 0")
    }
}
