//
//  Volume.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct Volume: MeasurementProtocol {
    static var name = "Temperature"
    
    private static let milliliters = Unit(name: "Milliliters", unit: UnitVolume.milliliters)
    private static let liters = Unit(name: "Liters", unit: UnitVolume.liters)
    private static let kiloliters = Unit(name: "Kiloliters", unit: UnitVolume.kiloliters)
    
    private static let pints = Unit(name: "Pints", unit: UnitVolume.pints)
    private static let quart = Unit(name: "Quarts", unit: UnitVolume.quarts)
    private static let gallons = Unit(name: "Gallons", unit: UnitVolume.gallons)

    static let includedUnits = [milliliters, liters, kiloliters, pints, quart, gallons]
}
