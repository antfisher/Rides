//
//  VehicleListViewTests.swift
//  RidesTests
//
//  Created by Anton Rybaiev on 2024-09-19.
//

import XCTest
@testable import Rides

final class VehicleListViewTests: XCTestCase {
    
    var viewModel: VehicleListView.ViewModel!
    
    override func setUpWithError() throws {
        
        viewModel = VehicleListView.ViewModel(coordinator: MockedCoordinator())
    }
    
    func testValidateSize_EmptyString() {
        viewModel.numberOfVehicles = ""
        XCTAssertFalse(viewModel.inputIsValid)
        XCTAssertNil(viewModel.inputError)
    }
    
    func testValidateSize_NonNumericString() {
        viewModel.numberOfVehicles = "abc"
        XCTAssertFalse(viewModel.inputIsValid)
        XCTAssertEqual(viewModel.inputError, "Enter a valid number")
    }
    
    func testValidateSize_TooLargeNumber() {
        viewModel.numberOfVehicles = "101"
        XCTAssertFalse(viewModel.inputIsValid)
        XCTAssertEqual(viewModel.inputError, "Size must be less than or equal to 100")
    }
    
    func testValidateSize_TooSmallNumber() {
        viewModel.numberOfVehicles = "0"
        XCTAssertFalse(viewModel.inputIsValid)
        XCTAssertEqual(viewModel.inputError, "Size must be at least 1")
    }
    
    func testValidateSize_ValidNumber() {
        viewModel.numberOfVehicles = "50"
        XCTAssertTrue(viewModel.inputIsValid)
        XCTAssertNil(viewModel.inputError)
    }
}
