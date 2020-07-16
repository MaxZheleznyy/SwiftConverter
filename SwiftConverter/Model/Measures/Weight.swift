//
//  Weight.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Foundation

public enum WeightUnit: Double {
    //metric
    case milligram = 0.001
    case gram = 1
    case kilogram = 1000
    case ton = 1000000
    
    //imperial
    case ounce = 28.3495
    case pound = 453.592

    static var defaultWeight: Double {
        return WeightUnit.gram.rawValue
    }
}

public struct Weight {
    public let value: Double
    public let unit: WeightUnit

    public init(value: Double, unit: WeightUnit) {
        self.value = value
        self.unit = unit
    }

    public func convertTo(weight: WeightUnit) -> Weight {
        let currentUnitGramValue = self.value * self.unit.rawValue
        let desiredUnit = currentUnitGramValue / weight.rawValue
        return Weight(value: desiredUnit, unit: weight)
    }
}

public extension Double {
    var milligram: Weight {
        return Weight(value: self, unit: .milligram)
    }

    var gram: Weight {
        return Weight(value: self, unit: .gram)
    }

    var kilogram: Weight {
        return Weight(value: self, unit: .kilogram)
    }

    var ton: Weight {
        return Weight(value: self, unit: .ton)
    }

    var ounce: Weight {
        return Weight(value: self, unit: .ounce)
    }

    var pound: Weight {
        return Weight(value: self, unit: .pound)
    }
}
