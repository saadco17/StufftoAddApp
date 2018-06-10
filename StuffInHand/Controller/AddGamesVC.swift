//  AddGamesVC.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 04/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.

import UIKit

protocol GameCounter {
    func countGames(counter: Int)
}

class AddGamesVC: UIViewController {
    
    var gameCounterDelegate: GameCounter!
    
    let picker = UIDatePicker()
    
    @IBOutlet weak var addGameTextField: UITextField!
    
    @IBOutlet weak var releaseYearTextField: UITextField!
    
    @IBOutlet weak var selectGameConsoleTextField: UITextField!
    
    @IBAction func addGameButton(_ sender: UIButton) {
        
        let addGame = Game(title: "\(String(describing: addGameTextField.text))",
            releaseYear: "\(String(describing: releaseYearTextField.text))",
            console: "\(String(describing: selectedGameInPickerView))")
       
        if addGameTextField.text != ""
            && releaseYearTextField.text != ""
            && selectedGameInPickerView != nil
        {
            game.append(addGame)
            gameCounterDelegate?.countGames(counter: game.count)
            print("Game Array has : \(game)")
            dismiss(animated: true, completion: nil)
        }
            
        else if selectedGameInPickerView == nil &&
            releaseYearTextField.text == ""
            && addGameTextField.text == ""
        {
            print("Error")
        }
    }
    
    @IBAction func cancelGameButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGameTextField.delegate = self
        
        // UIPickerViews
        addConsolePickerView()
        createToolBar()
        createDatePicker()
    }
    
    // Date Picker View
    func createDatePicker() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.isUserInteractionEnabled = true
        releaseYearTextField.inputAccessoryView = toolbar
        releaseYearTextField.inputView = picker
        picker.backgroundColor = UIColor.white
        picker.datePickerMode = .date
        toolbar.barTintColor = UIColor.black
        toolbar.tintColor = UIColor.white
       
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddGamesVC.donePressed))
        toolbar.setItems([done], animated: true)
    }
    
    @objc func donePressed() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .none
        dateFormat.dateFormat = "YYYY"
        let dateString = dateFormat.string(from: picker.date)
        releaseYearTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    // Create UIPickerView
    func addConsolePickerView() {
        let consolePickerView = UIPickerView()
        consolePickerView.delegate = self
        selectGameConsoleTextField.inputView = consolePickerView
        consolePickerView.backgroundColor = UIColor.white
    }
    
    // Creat ToolBar (Done button for Picker View)
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = UIColor.black
        toolBar.tintColor = UIColor.white
        selectGameConsoleTextField.inputAccessoryView = toolBar
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddGamesVC.dismissKeyBoard))
        toolBar.setItems([doneButton], animated: true)
    }
    
    // Dismiss Keyboard on UIPickerView Done Button
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
}

extension AddGamesVC: UITextFieldDelegate {
    
    // Hide the Keyboard on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide the keyboard when press Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addGameTextField.resignFirstResponder()
        return (true)
    }
}

extension AddGamesVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consoles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGameInPickerView = consoles[row]
        selectGameConsoleTextField.text = selectedGameInPickerView
    }
}
