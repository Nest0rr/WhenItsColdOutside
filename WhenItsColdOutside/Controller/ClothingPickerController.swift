//
//  ClothingPickerController.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 13/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import UIKit

protocol ChangeClothingTypeDelegate {
    func newClothingType(clothing: String)
}

class ClothingPickerController: UIViewController{
    let clothing = ["Tshirt",
                        "Sweater",
                        "Jacket",
                        "Winter Jacket"]
        
    var selectedClothing: String?
    var apparelArray = [Apparel]()
    
    var delegate: ChangeClothingTypeDelegate?
    
    @IBOutlet weak var clothingPickerTextField: UITextField!
    @IBAction func tappingTextField(_ sender: UITextField) {
        createPickerView()
        createToolBar()
    }
    @IBAction func saveChoice(_ sender: AnyObject) {
        let choice = clothingPickerTextField.text!          //transferring the selected clothing
        delegate?.newClothingType(clothing: choice)         //to the master view controller
        self.dismiss(animated: true, completion: nil)
    }

//MARK: - Creating PickerView and toolbar
    
    func createPickerView() {
        let clothingPicker = UIPickerView()
        clothingPicker.delegate = self

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



//MARK: - PickerView configuration methods

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
