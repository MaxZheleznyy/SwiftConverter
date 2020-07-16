//
//  Power.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

public enum PowerUnit: Double {
    //standart
    case milliwatt = 0.001
    case watt = 1
    case kilowatt = 1000
    case megawatt = 1000000
    case gigawatt = 1000000000

    static var defaultPower: Double {
        return PowerUnit.watt.rawValue
    }
}

public struct Power {
    public let value: Double
    public let unit: PowerUnit

    public init(value: Double, unit: PowerUnit) {
        self.value = value
        self.unit = unit
    }

    public func convertTo(power: PowerUnit) -> Power {
        let currentUnitWattValue = self.value * self.unit.rawValue
        let desiredUnit = currentUnitWattValue / power.rawValue
        return Power(value: desiredUnit, unit: power)
    }
}

public extension Double {
    var milliwatt: Power {
        return Power(value: self, unit: .milliwatt)
    }

    var watt: Power {
        return Power(value: self, unit: .watt)
    }

    var kilowatt: Power {
        return Power(value: self, unit: .kilowatt)
    }

    var megawatt: Power {
        return Power(value: self, unit: .megawatt)
    }

    var gigawatt: Power {
        return Power(value: self, unit: .gigawatt)
    }
}
