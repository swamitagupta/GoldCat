//
//  ObjectViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class ObjectCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
}

class ObjectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var ind = 0
    var index = 0
    var list : [String] = []
    var images : [UIImage?] = []
    var filteredData: [String]!
    let fields = ["All","Design", "Architecture", "Engineering", "Art", "Music","Finance", "Nature", "Math"]
    var imageDict: [String: UIImage?] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        list = listing[ind].list
        images = listing[ind].images
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = list
        
        for i in 0...list.count-1 {
            imageDict[list[i]] = images[i]
            
        (searchBar.value(forKey: "searchField") as? UITextField)!.textColor = UIColor.white
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as! ObjectCell
        cell.titleLabel?.text = filteredData[indexPath.row]
        cell.picture.image = imageDict[filteredData[indexPath.row]] as! UIImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300;//Choose your custom row height
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? list : list.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
}
