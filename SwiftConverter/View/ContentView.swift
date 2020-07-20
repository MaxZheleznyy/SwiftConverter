//
//  ContentView.swift
//  SwiftConverter
//
//  Created by Maxim Zheleznyy on 7/16/20.
//  Copyright © 2020 Maxim Zheleznyy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    Picker("", selection: $viewModel.selectedMeasurmentIndex) {
                        ForEach(0 ..< viewModel.measurments.count, id: \.self) {
                            Text("\(self.viewModel.measurments[$0].name)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section() {
                    HStack {
                        TextField("Enter value", text: $viewModel.stringedValueToConvert)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text(viewModel.selectedInputNamedUnit.name)
                    }
                    .padding(.horizontal)
                    
                    Picker("", selection: $viewModel.inputUnitIndex) {
                        ForEach(0 ..< viewModel.namedUnits.count, id: \.self) { i in
                            Text(self.viewModel.namedUnits[i].unit.symbol)
                        }
                    }
                    .id(viewModel.selectedMeasurmentIndex)
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
                        Text(format(number: viewModel.calculatedResult))
                        Spacer()
                        Text(viewModel.selectedOutputNamedUnit.name)
                    }
                    .padding(.horizontal)

                    Picker("", selection: $viewModel.outputUnitIndex) {
                        ForEach(0 ..< viewModel.namedUnits.count, id: \.self) { i in
                            Text(self.viewModel.namedUnits[i].unit.symbol)
                        }
                    }
                    .id(viewModel.selectedMeasurmentIndex)
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
        let currentInputUnitIndex = self.viewModel.inputUnitIndex
        let currentOutputUnitIndex = self.viewModel.outputUnitIndex
        
        self.viewModel.inputUnitIndex = currentOutputUnitIndex
        self.viewModel.outputUnitIndex = currentInputUnitIndex
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
