//
//  ContentView.swift
//  Challenge1-Converter
//
//  Created by suhail on 07/02/24.
//

import SwiftUI

struct ContentView: View {

    @State private var inputUnit = "feet"
    @State private var outputUnit = "feet"
    @State private var inputLength = 0.0
    var tempUnits = ["feet","yard","inches","meter","km"]
    
    //converts the entered length into base unit(icnhes)
    var convertedOutputLength: Double{
        var baseLen = 0.0
        var convertedLen = baseLen
        
        convertToBase()
        convertToOutput()
        //converts the input length into the base unit lenth
        
        func convertToBase(){
            if inputUnit == "feet"{
                baseLen = inputLength * 12
            }else if inputUnit == "yard"{
                baseLen = inputLength * 36
            }else if inputUnit == "inches"{
                baseLen = inputLength
            }else if inputUnit == "meter"{
                baseLen = inputLength * 39.3701
            }else{
                baseLen = inputLength * 39370.1
            }
           
        }
            //convert to output unit
            func convertToOutput(){
                if outputUnit == "feet"{
                    convertedLen = baseLen * 0.0833333
                }else if outputUnit == "yard"{
                    convertedLen = baseLen * 0.0277778
                }else if outputUnit == "inches"{
                    convertedLen = baseLen
                }else if outputUnit == "meter"{
                    convertedLen = baseLen * 0.0254
                }else{
                    convertedLen = baseLen * 0.0000254
                }

            }
            return convertedLen
        
    }
    var body: some View {
        NavigationStack{
            Form{
                //input unit picker
                Section("Select the input unit :"){
                    Picker("Select input unit", selection: $inputUnit){
                        ForEach(tempUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                //Input length text
                Section{
                    TextField("Enter Here",value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                }header: {
                    Text("Enter the input length in \(inputUnit)")
                }
                
                //output unit picker
                Section("Select the output unit: "){
                    Picker("Select output unit", selection: $outputUnit){
                        ForEach(tempUnits.filter({ $0 != inputUnit
                        }), id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // output text view
                Section("length in \(outputUnit)"){
                    Text(convertedOutputLength,format: .number)
                }
                
            }
            .navigationTitle("Temp Converter")
            
        }
    }
}

#Preview {
    ContentView()
}
