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
    
    private static let milligrams = NamedUnit(name: "Milligrams", unit: UnitMass.milligrams)
    private static let grams = NamedUnit(name: "Grams", unit: UnitMass.grams)
    private static let kilograms = NamedUnit(name: "Kilograms", unit: UnitMass.kilograms)
    private static let tons = NamedUnit(name: "Tons", unit: UnitMass.metricTons)
    
    private static let ounces = NamedUnit(name: "Ounces", unit: UnitMass.ounces)
    private static let pounds = NamedUnit(name: "Pounds", unit: UnitMass.pounds)

    static let includedUnits = [milligrams, grams, kilograms, tons, ounces, pounds]
}
