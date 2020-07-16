//
//  Temperature.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

public enum TemperatureUnit: Double {
    //metric
    case celsius
    
    //imperial
    case fahrenheit

    static var defaultTemperature: Double {
        return TemperatureUnit.celsius.rawValue
    }
}

public struct Temperature {
    public let value: Double
    public let unit: TemperatureUnit

    public init(value: Double, unit: TemperatureUnit) {
        self.value = value
        self.unit = unit
    }

    public func convertTo(temperature: TemperatureUnit) -> Temperature {
        if temperature == .celsius {
            return Temperature(value: (self.value - 32) / 1.8, unit: unit)
        } else {
            return Temperature(value: self.value * 1.8 + 32, unit: unit)
        }
    }
}

public extension Double {
    var celsius: Temperature {
        return Temperature(value: self, unit: .celsius)
    }
    
    var fahrenheit: Temperature {
        return Temperature(value: self, unit: .fahrenheit)
    }
}
