//
//  Weight.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct Weight: MeasurementProtocol {
    static var name = "Weight"
    
    private static let milligrams = Unit(name: "Milligrams", unit: UnitMass.milligrams)
    private static let grams = Unit(name: "Grams", unit: UnitMass.grams)
    private static let kilograms = Unit(name: "Kilograms", unit: UnitMass.kilograms)
    private static let tons = Unit(name: "Tons", unit: UnitMass.metricTons)
    
    private static let ounces = Unit(name: "Ounces", unit: UnitMass.ounces)
    private static let pounds = Unit(name: "Pounds", unit: UnitMass.pounds)

    static let includedUnits = [milligrams, grams, kilograms, tons, ounces, pounds]
}
