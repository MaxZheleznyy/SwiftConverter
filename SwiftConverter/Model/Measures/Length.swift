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
    
    private static let millimeters = Unit(name: "Millimeters", unit: UnitLength.millimeters)
    private static let centimeter = Unit(name: "Centimeter", unit: UnitLength.centimeters)
    private static let meters = Unit(name: "Meters", unit: UnitLength.meters)
    private static let kilometers = Unit(name: "Kilometers", unit: UnitLength.kilometers)
    
    private static let inches = Unit(name: "Inches", unit: UnitLength.inches)
    private static let feet = Unit(name: "Feet", unit: UnitLength.feet)
    private static let yards = Unit(name: "Yard", unit: UnitLength.yards)
    private static let miles = Unit(name: "Miles", unit: UnitLength.miles)
    
    private static let parsecs = Unit(name: "Parsecs", unit: UnitLength.parsecs)

    static let includedUnits = [millimeters, centimeter, meters, kilometers, inches, feet, yards, miles, parsecs]
}
