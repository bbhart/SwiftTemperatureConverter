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
    var pickerData = [String]()
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = Array(minTemp...maxTemp).map( { i in "\(i)°C"} )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("Call to titleforrow for row \(row)")
        return pickerData[row]
    }


}


