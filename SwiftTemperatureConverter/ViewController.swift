//
//  ViewController.swift
//  SwiftTemperatureConverter
//
//  Created by Brian Hart on 8/14/17.
//  Copyright © 2017 Brian Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Min and max to seed the picker with
    let minTemp = -40
    let maxTemp = 40
    var pickerData = [Int]()
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = Array(minTemp...maxTemp)
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
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(pickerData[row])
        } else {
            return "°C"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    
    internal func setTemperatureMiddle() {
        picker.selectRow(Int(pickerData.count / 2), inComponent: 0, animated: false)
    }
    
    internal func CtoF(tempToConvert: Int) -> Int {
        return Int(Double(tempToConvert) * 1.8 + 32)
    }
    
    internal func updateLabel() {
        let C = Int(pickerData[picker.selectedRow(inComponent: 0)])
        temperatureLabel.text = String(CtoF(tempToConvert: C)) + "°F"
    }


}


