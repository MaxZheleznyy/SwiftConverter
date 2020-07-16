//
//  Length.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

public enum LengthUnit: Double {
    //metric
    case millimeter = 0.001
    case centimeter = 0.01
    case meter = 1
    case kilometer = 1000
    
    //imperial
    case inch = 0.0254
    case foot = 0.3048
    case yard = 0.9144
    case mile = 1609.34
    
    //space
    case parsec = 30856775812799588

    static var defaultLength: Double {
        return LengthUnit.meter.rawValue
    }
}

public struct Length {
    public let value: Double
    public let unit: LengthUnit

    public init(value: Double, unit: LengthUnit) {
        self.value = value
        self.unit = unit
    }

    public func convertTo(length: LengthUnit) -> Length {
        let currentUnitMeterValue = self.value * self.unit.rawValue
        let desiredUnit = currentUnitMeterValue / length.rawValue
        return Length(value: desiredUnit, unit: length)
    }
}

public extension Double {
    var millimeter: Length {
        return Length(value: self, unit: .millimeter)
    }

    var centimeter: Length {
        return Length(value: self, unit: .centimeter)
    }
    
    var meter: Length {
        return Length(value: self, unit: .meter)
    }
    
    var kilometer: Length {
        return Length(value: self, unit: .kilometer)
    }
    
    var inch: Length {
        return Length(value: self, unit: .inch)
    }
    
    var foot: Length {
        return Length(value: self, unit: .foot)
    }
    
    var yard: Length {
        return Length(value: self, unit: .yard)
    }
    
    var mile: Length {
        return Length(value: self, unit: .mile)
    }

    var parsec: Length {
        return Length(value: self, unit: .parsec)
    }
}
