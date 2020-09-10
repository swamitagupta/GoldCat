//
//  HomeViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = theory.text
        textLabel.text = illustration.text
        image.isHidden = true
        textLabel.isHidden = true

    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            textView.isHidden = false
            textLabel.isHidden = true
            image.isHidden = true
        case 1:
            textView.isHidden = true
            textLabel.isHidden = false
            image.isHidden = false
        default:
            break
        }
    }

}
