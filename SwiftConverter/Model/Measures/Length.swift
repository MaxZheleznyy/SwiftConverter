//
//  Length.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

struct Length: MeasurementProtocol {
    static var name = "Length"
    
    private static let millimeters = NamedUnit(name: "Millimeters", unit: UnitLength.millimeters)
    private static let centimeter = NamedUnit(name: "Centimeter", unit: UnitLength.centimeters)
    private static let meters = NamedUnit(name: "Meters", unit: UnitLength.meters)
    private static let kilometers = NamedUnit(name: "Kilometers", unit: UnitLength.kilometers)
    
    private static let inches = NamedUnit(name: "Inches", unit: UnitLength.inches)
    private static let feet = NamedUnit(name: "Feet", unit: UnitLength.feet)
    private static let yards = NamedUnit(name: "Yard", unit: UnitLength.yards)
    private static let miles = NamedUnit(name: "Miles", unit: UnitLength.miles)
    
    private static let parsecs = NamedUnit(name: "Parsecs", unit: UnitLength.parsecs)

    static let includedUnits = [millimeters, centimeter, meters, kilometers, inches, feet, yards, miles, parsecs]
}
