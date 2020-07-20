//
//  Area.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

import Foundation

struct Area: MeasurementProtocol {
    static var name = "Area"
    
    private static let squareCentimeters = NamedUnit(name: "Square Centimeters", unit: UnitArea.squareCentimeters)
    private static let squareMeters = NamedUnit(name: "Square Meters", unit: UnitArea.squareMeters)
    private static let hectares = NamedUnit(name: "Hectares", unit: UnitArea.hectares)
    private static let squareKilometers = NamedUnit(name: "Square Kilometers", unit: UnitArea.squareKilometers)
    
    private static let squareFeets = NamedUnit(name: "Square Feets", unit: UnitArea.squareFeet)
    private static let squareYards = NamedUnit(name: "Square Yards", unit: UnitArea.squareYards)
    private static let squareAcres = NamedUnit(name: "Square Acres", unit: UnitArea.acres)
    private static let squareMiles = NamedUnit(name: "Square Miles", unit: UnitArea.squareMiles)
    
    static let includedUnits = [squareCentimeters, squareMeters, hectares, squareKilometers, squareFeets, squareYards, squareAcres, squareMiles]
}
