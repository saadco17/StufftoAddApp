//  AddBooksVC.swift
//  StuffInHand
//
//  Created by Saad Sikandar on 04/06/2018.
//  Copyright © 2018 Saad Sikandar. All rights reserved.

import UIKit

protocol BookCounter {
    func countBooks(counter: Int)
}

class AddBooksVC: UIViewController {

    var bookCounterDelegate: BookCounter!
    
    @IBOutlet weak var addBookTextField: UITextField!
    
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var publishedYearTextField: UITextField!
    
    @IBOutlet weak var pagesTextField: UITextField!
    
    @IBAction func addBookButton(_ sender: UIButton) {
        
        var pagesTextFieldInt: Int? = Int(pagesTextField.text!)
        
        pagesTextFieldInt = 0
        
        let addBook = Book(title: "\(String(describing: addBookTextField.text))",
            author: "\(String(describing: authorTextField.text))",
            pages: pagesTextFieldInt!,
            category: "\(String(describing: categoryTextField.text))",
            date: "\(String(describing: publishedYearTextField.text))")
        
        if addBookTextField.text != ""
            && authorTextField.text != ""
            && publishedYearTextField.text != ""
            && categoryTextField.text != ""
            && pagesTextFieldInt != nil
        {
                book.append(addBook)
                bookCounterDelegate?.countBooks(counter: book.count)
                dismiss(animated: true, completion: nil)
        }
            
        else if addBookTextField.text == ""
            && authorTextField.text == ""
            && publishedYearTextField.text == ""
            && categoryTextField.text == ""
            && pagesTextFieldInt == 0
        {
            print("error 1")
        }
    }
    
    @IBAction func cancelBookButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textTags()
    }
    
    func textTags() {
        
        let allTexts = [addBookTextField, authorTextField, categoryTextField, publishedYearTextField, pagesTextField]
        
        for newTag in 0...4 {
            allTexts[newTag]?.tag = newTag + 1
            allTexts[newTag]?.returnKeyType = .next
            allTexts[newTag]?.delegate = self
        }
    }
}

extension AddBooksVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.returnKeyType = .next
        
        switch textField.tag {
        case 1:
            authorTextField.becomeFirstResponder()
        case 2:
            categoryTextField.becomeFirstResponder()
        case 3:
            publishedYearTextField.becomeFirstResponder()
        case 4:
            pagesTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}

extension AddBooksVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return book.count
    }
}
