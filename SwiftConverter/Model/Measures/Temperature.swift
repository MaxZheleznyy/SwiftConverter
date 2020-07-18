//
//  Temperature.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct Temperature: MeasurementProtocol {
    static var name = "Temperature"
    
    private static let celsius = Unit(name: "Celsius", unit: UnitTemperature.celsius)
    private static let fahrenheit = Unit(name: "Fahrenheit", unit: UnitTemperature.fahrenheit)

    static let includedUnits = [celsius, fahrenheit]
}
