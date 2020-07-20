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
                        self.viewModel.swapInputOutput()
                    }) {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .font(.title)
                        .padding(.bottom, 20)
                    }
                    
                    Spacer()
                }) {
                    HStack {
                        Text(viewModel.calculatedResult.convertToShortString())
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
