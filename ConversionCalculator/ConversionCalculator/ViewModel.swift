//
//  ViewModel.swift
//  ConversionCalculator
//
//  Created by Jeffrey Rohlman on 7/28/17.
//  Copyright © 2017 Jeffrey Rohlman. All rights reserved.
//

import Foundation

class viewModel {
    var unit1 = "°C"
    var unit2 = "°F"
    var value1 = 0.00
    var value2 = 0.00
    
    func convertValues() -> Double{
        switch unit2{
            case "°C":
                return (value2 * (9/5) + 32)
            case "°F":
                return ((value2 - 32) * (5/9))
            case "mi":
                return value2 * 1.60934
            case "km":
                return value2 * 0.621371
            default:
                return 0
        }
    }
}
