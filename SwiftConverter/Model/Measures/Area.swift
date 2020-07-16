//
//  Area.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

public enum AreaUnit: Double {
    //metric
    case squareCentimeter = 0.0001
    case squareMeter = 1
    case hectare = 10000
    case squareKilometer = 1000000
    
    //imperial
    case squareFoot = 0.092903
    case squareYard = 0.836127
    case acre = 4046.86
    case squareMile = 2589988.1
    

    static var defaultArea: Double {
        return AreaUnit.squareMeter.rawValue
    }
}

public struct Area {
    public let value: Double
    public let unit: AreaUnit

    public init(value: Double, unit: AreaUnit) {
        self.value = value
        self.unit = unit
    }

    public func convertTo(area: AreaUnit) -> Area {
        let currentUnitSQMeterValue = self.value * self.unit.rawValue
        let desiredUnit = currentUnitSQMeterValue / area.rawValue
        return Area(value: desiredUnit, unit: area)
    }
}

public extension Double {
    var squareCentimeter: Area {
        return Area(value: self, unit: .squareCentimeter)
    }
    
    var squareMeter: Area {
        return Area(value: self, unit: .squareMeter)
    }
    
    var hectare: Area {
        return Area(value: self, unit: .hectare)
    }

    var squareKilometer: Area {
        return Area(value: self, unit: .squareKilometer)
    }
    
    var squareFoot: Area {
        return Area(value: self, unit: .squareFoot)
    }

    var squareYard: Area {
        return Area(value: self, unit: .squareYard)
    }
    
    var acre: Area {
        return Area(value: self, unit: .acre)
    }
    
    var squareMile: Area {
        return Area(value: self, unit: .squareMile)
    }
}
