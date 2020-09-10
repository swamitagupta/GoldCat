//
//  DetailViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var ind = 0
    var index = 0

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = listing[ind].list[index]
        imageView.image = listing[ind].images[index]
    }
}
