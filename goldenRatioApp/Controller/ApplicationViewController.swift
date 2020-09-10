//
//  ApplicationViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var ind = 0
    
    let fields = ["Design", "Architecture", "Engineering", "Art", "Music", "Nature", "Math", "Pyramids"]
    let icons = [UIImage(systemName: "pencil.and.outline")
    ,UIImage(systemName: "house")
    ,UIImage(systemName: "gear")
    ,UIImage(systemName: "paintbrush.fill")
    ,UIImage(systemName: "music.note.list")
    ,UIImage(systemName: "globe")
    ,UIImage(systemName: "plus.slash.minus")
    ,UIImage(systemName: "triangle.lefthalf.fill") ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fields.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CollectionViewCell
        cell.contentView.backgroundColor = UIColor(named: "Golden")
        cell.titleLabel.textColor = UIColor.black
        cell.titleLabel.text = fields[indexPath.item]
        cell.icon.image = icons[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ind = indexPath.row
        performSegue(withIdentifier: "fieldToObject", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Compute the dimension of a cell for an NxN layout with space S between
        // cells.  Take the collection view's width, subtract (N-1)*S points for
        // the spaces between the cells, and then divide by N to find the final
        // dimension for the cell's width and height.
        let dim = collectionView.bounds.width/2.1
        return CGSize(width: dim, height: dim)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ObjectViewController
        vc.ind = ind
    }


}
