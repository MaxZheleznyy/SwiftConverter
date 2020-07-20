//
//  Power.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct Power: MeasurementProtocol {
    static var name = "Power"
    
    private static let milliwatts = NamedUnit(name: "Milliwatts", unit: UnitPower.milliwatts)
    private static let watts = NamedUnit(name: "Watts", unit: UnitPower.watts)
    private static let kilowatts = NamedUnit(name: "Kilowatts", unit: UnitPower.kilowatts)
    private static let megawatts = NamedUnit(name: "Megawatts", unit: UnitPower.megawatts)
    private static let gigawatt = NamedUnit(name: "Gigawatts", unit: UnitPower.gigawatts)

    static let includedUnits = [milliwatts, watts, kilowatts, megawatts, gigawatt]
}
