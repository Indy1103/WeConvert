//
//  ContentView.swift
//  WeConvert
//
//  Created by Induwara on 2023-07-06.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var currentVal = 0
    @State private var startUnit = "m"
    @State private var finalUnit = "m"
    
    
    let lenConv = ["m", "Km", "Feet", "Yard", "Miles"]
    
    func convBaseUnit(curnVal: Double) -> Double
    {
        var baseVal = 10.0
        
        if startUnit == "Km"{
            
            baseVal = Double(curnVal) * 1000.00
            
        } else if startUnit == "Feet" {
            
            baseVal = Double(curnVal)/3.281
            
        } else if startUnit == "Yard"{
            
            baseVal = Double(curnVal)/1.094
            
        } else if startUnit == "Miles"{
            
            baseVal = Double(curnVal) * 1609.0
            
        } else if startUnit == "m"{
            
            baseVal = Double(curnVal)
            
        }
        
        return baseVal
    }
    
    func convNewUnit(curnVal: Double) -> Double
    {
        var baseVal = 20.0
        
        if finalUnit == "Km"{
            
            baseVal = Double(curnVal) / 1000.00
            
        } else if finalUnit == "Feet" {
            
            baseVal = Double(curnVal)*3.281
            
        } else if finalUnit == "Yard"{
            
            baseVal = Double(curnVal)*1.094
            
        } else if finalUnit == "Miles"{
            
            baseVal = Double(curnVal) / 1609.0
            
        } else if finalUnit == "m"{
            
            baseVal = Double(curnVal)
            
        }
        
        return baseVal
    }
    
    var NewVal: Double{
        
        let newVal = convNewUnit(curnVal: convBaseUnit(curnVal: Double(currentVal)))
        
        return newVal
    }
    

    
        
    
    var body: some View {
        
        NavigationView{
            
            Form{
                
                Section{
                                        
                    TextField("Enter Value", value: $currentVal, format: .number).keyboardType(.decimalPad)
                    
                    Picker("Units", selection: $startUnit){
                        
                        ForEach(lenConv, id: \.self){
                            
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }header: {
                    Text("Enter Value")
                }
                
                
                
                Section{
                    Picker("New Units", selection: $finalUnit){
                        
                        ForEach(lenConv, id: \.self){
                            
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    
                }header: {
                    Text("New Units")
                }
                
                Section{
                    
                    Text(NewVal, format: .number)
                    
                    
                }header: {
                    Text("New Value")
                }
                
                
                
                
            }.navigationTitle("WeConvert")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
