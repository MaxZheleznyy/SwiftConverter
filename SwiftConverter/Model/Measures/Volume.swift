//
//  Volume.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

public enum VolumeUnit: Double {
    //metric
    case milliliter = 0.001
    case liter = 1
    case kiloliter = 1000
    
    //imperial
    case gill = 0.118294
    case pint = 0.473176
    case quart = 0.946353
    case gallon = 3.78541

    static var defaultScale: Double {
        return VolumeUnit.liter.rawValue
    }
}

public struct Volume {
    public let value: Double
    public let unit: VolumeUnit

    public init(value: Double, unit: VolumeUnit) {
        self.value = value
        self.unit = unit
    }

    public func convertTo(volume: VolumeUnit) -> Volume {
        let currentUnitLiterValue = self.value * self.unit.rawValue
        let desiredUnit =  currentUnitLiterValue / volume.rawValue
        return Volume(value: desiredUnit, unit: volume)
    }
}

public extension Double {
    var milliliter: Volume {
        return Volume(value: self, unit: .milliliter)
    }

    var liter: Volume {
        return Volume(value: self, unit: .liter)
    }

    var kiloliter: Volume {
        return Volume(value: self, unit: .kiloliter)
    }

    var gill: Volume {
        return Volume(value: self, unit: .gill)
    }
    
    var pint: Volume {
        return Volume(value: self, unit: .pint)
    }
    
    var quart: Volume {
        return Volume(value: self, unit: .quart)
    }

    var gallon: Volume {
        return Volume(value: self, unit: .gallon)
    }
}
