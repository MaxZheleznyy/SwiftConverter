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
    @State private var selectedMeasurmentIndex = 0
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 0
    
    var measurments: [MeasurementProtocol.Type] {
        return PublicMeasurments.measurments
    }
    
    var namedUnits: [NamedUnit] {
        return measurments[selectedMeasurmentIndex].includedUnits
    }
    
    var selectedInputNamedUnit: NamedUnit {
        return namedUnits[inputUnitIndex]
    }
    
    var selectedOutputNamedUnit: NamedUnit {
        return namedUnits[outputUnitIndex]
    }
    
    var calculatedResult: Double {
        let source = Measurement(value: Double(stringedValueToConvert) ?? 0, unit: selectedInputNamedUnit.unit)
        return source.converted(to: selectedOutputNamedUnit.unit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    Picker("", selection: $selectedMeasurmentIndex) {
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
                    
                    Picker("", selection: $inputUnitIndex) {
                        ForEach(0 ..< namedUnits.count, id: \.self) { i in
                            Text(self.namedUnits[i].unit.symbol)
                        }
                    }
                    .id(selectedMeasurmentIndex)
                    .pickerStyle(SegmentedPickerStyle())
                }
            
                Section(header: HStack {
                    Spacer()
                    
                    Button(action: {
                        self.swapInputOutput()
                    }) {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .font(.title)
                        .padding(.bottom, 20)
                    }
                    
                    Spacer()
                }) {
                    HStack {
                        Text(format(number: calculatedResult))
                        Spacer()
                        Text(selectedOutputNamedUnit.name)
                    }
                    .padding(.horizontal)

                    Picker("", selection: $outputUnitIndex) {
                        ForEach(0 ..< namedUnits.count, id: \.self) { i in
                            Text(self.namedUnits[i].unit.symbol)
                        }
                    }
                    .id(selectedMeasurmentIndex)
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
    
    func swapInputOutput() {
        let currentInputUnitIndex = self.inputUnitIndex
        let currentOutputUnitIndex = self.outputUnitIndex
        
        self.inputUnitIndex = currentOutputUnitIndex
        self.outputUnitIndex = currentInputUnitIndex
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
