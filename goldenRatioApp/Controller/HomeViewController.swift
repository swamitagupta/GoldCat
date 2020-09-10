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
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = theory.text
        imageView.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            textView.text = theory.text
            imageView.isHidden = true
        case 1:
            textView.text = illustration.text
            imageView.isHidden = false
        default:
            break
        }
    }

}
