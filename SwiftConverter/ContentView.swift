//
//  ContentView.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var stringedValueToConvert = ""
    
    @State private var unitTypeIndex = 0
    
    @State private var inputNamedUnitIndexes = Array(repeating: 0, count: PublicMeasurments.measurments.count)
    
    @State private var outputNamedUnitIndexes = Array(repeating: 0, count: PublicMeasurments.measurments.count)
    
    var measurments: [MeasurementProtocol.Type] {
        return PublicMeasurments.measurments
    }
    
    var namedUnits: [NamedUnit] {
        return measurments[unitTypeIndex].includedUnits
    }
    
    var selectedInputNamedUnit: NamedUnit {
        let selectedSourceIndex = inputNamedUnitIndexes[unitTypeIndex]
        return namedUnits[selectedSourceIndex]
    }
    
    var selectedOutputNamedUnit: NamedUnit {
        let selectedDestinationIndex = outputNamedUnitIndexes[unitTypeIndex]
        return namedUnits[selectedDestinationIndex]
    }
    
    var calculatedResult: Double {
        let source = Measurement(value: Double(stringedValueToConvert) ?? 0, unit: selectedInputNamedUnit.unit)
        return source.converted(to: selectedOutputNamedUnit.unit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    Picker("", selection: $unitTypeIndex) {
                        ForEach(0 ..< measurments.count, id: \.self) {
                            Text("\(self.measurments[$0].name)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section() {
                    HStack {
                        TextField("Enter value", text: $stringedValueToConvert)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text(selectedInputNamedUnit.name)
                    }
                    .padding(.horizontal)
                    
                    Picker("", selection: $inputNamedUnitIndexes[unitTypeIndex]) {
                        ForEach(0 ..< namedUnits.count, id: \.self) { i in
                            Text(self.namedUnits[i].unit.symbol)
                        }
                    }
                    .id(unitTypeIndex)
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section() {
                    HStack {
                        Text(format(number: calculatedResult))
                        Spacer()
                        Text(selectedOutputNamedUnit.name)
                    }
                    .padding(.horizontal)

                    Picker("", selection: $outputNamedUnitIndexes[unitTypeIndex]) {
                        ForEach(0 ..< namedUnits.count, id: \.self) { i in
                            Text(self.namedUnits[i].unit.symbol)
                        }
                    }
                    .id(unitTypeIndex)
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .gesture(
                DragGesture()
                    .onChanged {_ in
                        self.endEditing()
                }
            )
            .navigationBarTitle("Conversions")
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func format(number: Double) -> String {
        let formatter = NumberFormatter()
        let nsnumber = NSNumber(value: number)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
        
        return String(formatter.string(from: nsnumber) ?? "")
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
