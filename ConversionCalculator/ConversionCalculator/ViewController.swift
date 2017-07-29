//
//  ViewController.swift
//  ConversionCalculator
//
//  Created by Jeffrey Rohlman on 7/28/17.
//  Copyright © 2017 Jeffrey Rohlman. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var model = viewModel()
    var isDecimal = false
    var decimalSpot = 1.0
    
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var textBox2: UITextField!
    
    @IBAction func clearButton(_ sender: Any) {
        model.value2 = 0
        isDecimal = false
        decimalSpot = 1
        updateTextBoxes()
    }
    
    @IBAction func changeSignButton(_ sender: Any) {
        if model.value2 != 0 {
            model.value2 = model.value2 * -1
        }
        updateTextBoxes()
    }
    
    @IBAction func nineButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 9
        }
        else {
            model.value2 = model.value2 + 9.0 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func eightButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 8
        }
        else {
            model.value2 = model.value2 + 8 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 7
        }
        else {
            model.value2 = model.value2 + 7 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func sixButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 6
        }
        else {
            model.value2 = model.value2 + 6 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 5
        }
        else {
            model.value2 = model.value2 + 5 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func fourButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 4
        }
        else {
            model.value2 = model.value2 + 4 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func threeButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 3
        }
        else {
            model.value2 = model.value2 + 3 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func twoButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 2
        }
        else {
            model.value2 = model.value2 + 2 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func oneButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10 + 1
        }
        else {
            model.value2 = model.value2 + 1 / Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        if isDecimal == false {
            model.value2 = model.value2 * 10
        }
        else {
            model.value2 = model.value2 + 0.0 * Double(pow(10, decimalSpot))
            decimalSpot += 1
        }
        updateTextBoxes()
    }
    
    @IBAction func decimalButton(_ sender: Any) {
        if(!isDecimal){
            isDecimal = true
        }
    }
    
    
    @IBAction func convertButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Convertor", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.model.unit1 = "°C"
            self.model.unit2 = "°F"
            self.updateTextBoxes()
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.model.unit1 = "°F"
            self.model.unit2 = "°C"
            self.updateTextBoxes()
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.model.unit1 = "km"
            self.model.unit2 = "mi"
            self.updateTextBoxes()
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.model.unit1 = "mi"
            self.model.unit2 = "km"
            self.updateTextBoxes()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateTextBoxes(){
        if model.value2 != 0{
            model.value1 = model.convertValues()
            textBox1.text = "\((Double(round(100*model.value1)/100)).cleanValue) \(model.unit1)"
            if !isDecimal{
                textBox2.text = "\(model.value2.cleanValue) \(model.unit2)"
            }
            else{
                textBox2.text = "\(model.value2) \(model.unit2)"
            }
        }
        else{
            textBox1.text = "\(model.unit1)"
            textBox2.text = "\(model.unit2)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTextBoxes()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0lf", self) : String(self)
    }
}

