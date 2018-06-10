//  AddGadgetsVC.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 04/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.

import UIKit

protocol GadgetCounter {
    func countGadgets(counter: Int)
}

class AddGadgetsVC: UIViewController {
    
    var gadgetCounterDelegate: GadgetCounter!
    
    var years = [Int]()
    
    var selectedYear: Int?
    
    @IBOutlet weak var addGadgetTextField: UITextField!
    
    @IBOutlet weak var typeTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBAction func addGadgetButton(_ sender: UIButton) {
        
        // Convert the textField.text into Int
        var yearTextFiledInt: Int? = Int(yearTextField.text!)
        
        yearTextFiledInt = 0
        
        let addGadget = Gadget(model: "\(String(describing: addGadgetTextField.text))",
            type: "\(String(describing: typeTextField.text))",
            year: yearTextFiledInt!)
        
        if addGadgetTextField.text != ""
            && typeTextField.text != ""
            && yearTextFiledInt! >= 2000
        {
            gadget.append(addGadget)
            gadgetCounterDelegate?.countGadgets(counter: gadget.count)
        }
        
        else if addGadgetTextField.text == ""
            && typeTextField.text == ""
            && yearTextFiledInt == 0
        {
            print("Error 1")
        }
    }
    
    @IBAction func cancelGadgetButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGadgetTextField.delegate = self
        CreateYearArray()
        createYearPickerView()
        doneButton()
    }
    
    func CreateYearArray() {
        for addYear in 2000...2018 {
            years.append(addYear)
        }
    }
    
    // Create YearPickerView
    func createYearPickerView() {
        let yearPicker = UIPickerView()
        yearPicker.delegate = self
        yearPicker.dataSource = self
        yearTextField.inputView = yearPicker
        yearPicker.backgroundColor = UIColor.white
    }
    
    // Done Button
    func doneButton() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        yearTextField.inputAccessoryView = toolBar
        toolBar.barTintColor = UIColor.black
        toolBar.tintColor = UIColor.white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddGadgetsVC.donePressed))
        toolBar.setItems([doneButton], animated: true)
    }
    
    @objc func donePressed() {
        view.endEditing(true)
    }
}

extension AddGadgetsVC: UITextFieldDelegate {
    
    // Hide the KeyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide the KeyBoard when return pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addGadgetTextField.resignFirstResponder()
        return (true)
    }
}

extension AddGadgetsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\((years[row]))"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedYear = years[row]
        yearTextField.text = "\(selectedYear!)"
    }
}
