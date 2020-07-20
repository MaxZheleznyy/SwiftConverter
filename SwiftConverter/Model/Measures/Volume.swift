//
//  Volume.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct Volume: MeasurementProtocol {
    static var name = "Volume"
    
    private static let milliliters = NamedUnit(name: "Milliliters", unit: UnitVolume.milliliters)
    private static let liters = NamedUnit(name: "Liters", unit: UnitVolume.liters)
    private static let kiloliters = NamedUnit(name: "Kiloliters", unit: UnitVolume.kiloliters)
    
    private static let pints = NamedUnit(name: "Pints", unit: UnitVolume.pints)
    private static let quart = NamedUnit(name: "Quarts", unit: UnitVolume.quarts)
    private static let gallons = NamedUnit(name: "Gallons", unit: UnitVolume.gallons)

    static let includedUnits = [milliliters, liters, kiloliters, pints, quart, gallons]
}
