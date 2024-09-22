//
//  Vehicle.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-20.
//

import Foundation

struct Vehicle: Decodable, Identifiable, Equatable, Hashable {
    let id: Int
    let uid: String
    let vin: String
    let makeAndModel: String
    let color: String
    let transmission: String
    let driveType: String
    let fuelType: String
    let carType: String
    let carOptions: [String]
    let specs: [String]
    let doors: Int
    let mileage: Int
    let kilometrage: Int
    let licensePlate: String

    enum CodingKeys: String, CodingKey {
        case id
        case uid
        case vin
        case makeAndModel = "make_and_model"
        case color
        case transmission
        case driveType = "drive_type"
        case fuelType = "fuel_type"
        case carType = "car_type"
        case carOptions = "car_options"
        case specs
        case doors
        case mileage
        case kilometrage
        case licensePlate = "license_plate"
    }
}

// MARK: - Mocked object for tests and previews

extension Vehicle {
    static let mockedVehicle = Vehicle (
        id: 9503,
        uid: "eb1486f8-6aa2-439d-86e9-8baca19a657c",
        vin: "128T4SFY4ME371869",
        makeAndModel: "Dodge Challenger",
        color: "Violet",
        transmission: "Automanual",
        driveType: "FWD",
        fuelType: "Gasoline Hybrid",
        carType: "Minivan",
        carOptions: [
            "Memory Seats",
            "DVD System",
            "Cassette Player",
            "Power Locks",
            "CD (Multi Disc)"
        ],
        specs: [
            "Roof mounted antenna",
            "Emergency interior trunk release",
            "Body color front/rear bumpers",
            "Front/rear spot-lamp illumination",
            "Rear window defroster w/timer",
            "Dual illuminated visor vanity mirrors",
            "Body color sill extension",
            "Electronic brakeforce distribution (EBD) w/brake assist (BA) -inc: Smart stop technology"
        ],
        doors: 3,
        mileage: 31883,
        kilometrage: 30280,
        licensePlate: "GQP-4705"
    )
}
