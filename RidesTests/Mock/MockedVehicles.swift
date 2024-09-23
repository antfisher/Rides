//
//  MockedVehicles.swift
//  RidesTests
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import Foundation
@testable import Rides

extension Vehicle {
    static let threeThousandKilometrageVehicle = Vehicle(
        id: 1,
        uid: "uid1",
        vin: "1HGCM82633A123456",
        makeAndModel: "Honda Civic",
        color: "Blue",
        transmission: "Automatic",
        driveType: "FWD",
        fuelType: "Gasoline",
        carType: "Sedan",
        carOptions: ["Air Conditioning", "Power Windows", "Bluetooth"],
        specs: ["Roof mounted antenna", "Rearview Camera"],
        doors: 4,
        mileage: 12000,
        kilometrage: 3000,
        licensePlate: "ABC-1234"
    )
    
    static let sevenThousandKilometrageVehicle = Vehicle(
        id: 2,
        uid: "uid2",
        vin: "1FTFW1E82AFD12345",
        makeAndModel: "Ford F-150",
        color: "Red",
        transmission: "Manual",
        driveType: "4WD",
        fuelType: "Diesel",
        carType: "Truck",
        carOptions: ["Leather Seats", "Cruise Control", "Navigation System"],
        specs: ["Tow Package", "Bed Liner"],
        doors: 4,
        mileage: 45000,
        kilometrage: 7000,
        licensePlate: "XYZ-9876"
    )
    
    static let fiveThousandKilometrageVehicle = Vehicle(
        id: 3,
        uid: "uid3",
        vin: "2T3ZF4DV1BW123456",
        makeAndModel: "Toyota RAV4",
        color: "Green",
        transmission: "CVT",
        driveType: "AWD",
        fuelType: "Hybrid",
        carType: "SUV",
        carOptions: ["Sunroof", "Heated Seats", "Rear Parking Sensors"],
        specs: ["Electronic Stability Control", "Traction Control"],
        doors: 5,
        mileage: 30000,
        kilometrage: 5000,
        licensePlate: "LMN-4567"
    )
    
    static let negativeKilometrageVehicle = Vehicle(
        id: 4,
        uid: "uid4",
        vin: "2T3ZF4DV1BW123456",
        makeAndModel: "Toyota RAV4",
        color: "Green",
        transmission: "CVT",
        driveType: "AWD",
        fuelType: "Hybrid",
        carType: "SUV",
        carOptions: ["Sunroof", "Heated Seats", "Rear Parking Sensors"],
        specs: ["Electronic Stability Control", "Traction Control"],
        doors: 5,
        mileage: 30000,
        kilometrage: -5000,
        licensePlate: "LMN-4567"
    )
}
