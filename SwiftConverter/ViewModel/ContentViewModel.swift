//
//  ContentViewModel.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/20/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
    @Published var stringedValueToConvert = ""
    
    @Published var selectedMeasurmentIndex = 0 {
        didSet {
            inputUnitIndex = 0
            outputUnitIndex = 1
        }
    }
    
    @Published var inputUnitIndex = 0
    @Published var outputUnitIndex = 1
    
    
    var measurments: [MeasurementProtocol.Type] {
        return PublicMeasurments.measurments
    }
    
    var namedUnits: [NamedUnit] {
        if let measurment = measurments[safe: selectedMeasurmentIndex] {
            return measurment.includedUnits
        } else {
            return measurments[0].includedUnits
        }
    }
    
    var selectedInputNamedUnit: NamedUnit {
        if let namedUnit = namedUnits[safe: inputUnitIndex] {
            return namedUnit
        } else {
            return namedUnits[0]
        }
    }
    
    var selectedOutputNamedUnit: NamedUnit {
        if let namedUnit = namedUnits[safe: outputUnitIndex] {
            return namedUnit
        } else {
            return namedUnits[0]
        }
    }
    
    var calculatedResult: Double {
        let source = Measurement(value: Double(stringedValueToConvert) ?? 0, unit: selectedInputNamedUnit.unit)
        return source.converted(to: selectedOutputNamedUnit.unit).value
    }
    
    func swapInputOutput() {
        let currentInputUnitIndex = inputUnitIndex
        let currentOutputUnitIndex = outputUnitIndex
        
        inputUnitIndex = currentOutputUnitIndex
        outputUnitIndex = currentInputUnitIndex
    }
}
