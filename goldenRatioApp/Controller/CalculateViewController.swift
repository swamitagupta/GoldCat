//
//  CalculateViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var number = 0.0
    var smallerNumber = 0.0
    var greaterNumber = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        
        if let number = Double(inputField.text!) {
            smallerNumber = number/1.618033
            greaterNumber = number*1.618033
            resultLabel.text = "Shorter edge: \(String(format: "%.2f", smallerNumber)) units,\n Longer edge: \(String(format: "%.2f", greaterNumber)) units."
        } else {
            print("Invalid input")
        }
        
    }
}

//MARK: - Keyboard Methods

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
