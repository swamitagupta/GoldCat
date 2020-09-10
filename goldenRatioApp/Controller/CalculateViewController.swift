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
        
        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
