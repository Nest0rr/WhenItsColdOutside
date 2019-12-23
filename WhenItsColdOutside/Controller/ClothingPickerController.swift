//
//  ClothingPickerController.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 13/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import UIKit
import CoreData

//MARK: - TODO create a list of clothing and hook it up to pickerview.
//implement CoreData so selected item can be saved

class ClothingPickerController: UIViewController, UITextFieldDelegate {
    let clothing = ["Tshirt",
                        "Sweater",
                        "Jacket",
                        "Winter Jacket"]
        
    var selectedClothing: String?
    
    @IBOutlet weak var clothingPickerTextField: UITextField!
    
    @IBAction func tappingTextField(_ sender: UITextField) {
        createPickerView()
        createToolBar()
    }
    
    func createPickerView() {
        let clothingPicker = UIPickerView()
        clothingPicker.delegate = self
        
        clothingPickerTextField.delegate = self
        clothingPickerTextField.inputView = clothingPicker
        
    }
    
    func createToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        clothingPickerTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        clothingPickerTextField.endEditing(true)
    }
}

extension ClothingPickerController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return clothing.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return clothing[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedClothing = clothing[row]
        clothingPickerTextField.text = selectedClothing
    }
}
