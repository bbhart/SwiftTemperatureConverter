//
//  ViewController.swift
//  SwiftTemperatureConverter
//
//  Created by Brian Hart on 8/14/17.
//  Copyright © 2017 Brian Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    enum mode {
        case CtoF, FtoC
    }
    
    let c_seedrange = Array(-40...40)
    let f_seedrange = Array(0...120)
    
    var currentMode: mode = mode.CtoF
    
    // Min and max to seed the picker with
    
    var pickerData = [Int]()
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Start the app doing C to F conversion
        pickerData = c_seedrange
        
        setTemperatureMiddle()
        updateLabel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerData.count
        } else {
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var s = ""
        if component == 0 {
            s = String(pickerData[row])
        } else {
            if component == 1 {
                if row == 0 { s = "°C" }
                if row == 1 { s = "°F" }
            }
        }
        
        return s
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            // They changed the temperature
            updateLabel()
        }
        
        if component == 1 {
            // They switched from C to F or vice versa
            if row == 0 {
                // Set C
                currentMode = mode.CtoF
                pickerData = c_seedrange
            } else if row == 1 {
                // Set F
                currentMode = mode.FtoC
                pickerData = f_seedrange
            }
            updateLabel()
        }
    }
    
    internal func setTemperatureMiddle() {
        picker.selectRow(Int(pickerData.count / 2), inComponent: 0, animated: false)
    }
    
    internal func CtoF(tempToConvert: Int) -> Int {
        return Int(Double(tempToConvert) * 1.8 + 32)
    }
  
    internal func FtoC(tempToConvert: Int) -> Int {
        return Int((Double(tempToConvert) - 32 ) / 1.8)
    }
    
    internal func updateLabel() {
        let selected = Int(pickerData[picker.selectedRow(inComponent: 0)])
        if currentMode == mode.CtoF {
            temperatureLabel.text = String(CtoF(tempToConvert: selected)) + "°F"
        } else {
            temperatureLabel.text = String(FtoC(tempToConvert: selected)) + "°C"
        }
    }
}


