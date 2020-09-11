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

class ObjectViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var ind = 0
    
    var list : [String] = []
    var images : [UIImage?] = []
    var filteredData: [String]!
    let fields = ["All","Design", "Architecture", "Engineering", "Art", "Music","Finance", "Nature", "Math"]
    var imageDict: [String: UIImage?] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        list = listing[ind].list
        images = listing[ind].images
        filteredData = list
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        (searchBar.value(forKey: "searchField") as? UITextField)!.textColor = UIColor.white
        
        for i in 0...list.count-1 {
            imageDict[list[i]] = images[i]
        }
    }
}

//MARK: - UITableView Methods

extension ObjectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as! ObjectCell
        cell.titleLabel?.text = filteredData[indexPath.row]
        cell.picture.image = imageDict[filteredData[indexPath.row]]!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

//MARK: - UISearchBar Methods

extension ObjectViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? list : list.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
}
