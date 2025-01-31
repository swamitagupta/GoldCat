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
    
    let fields = ["All","Design", "Architecture", "Engineering", "Art", "Music","Finance", "Nature", "Math"]
    let icons = [UIImage(systemName: "rectangle.3.offgrid.fill")
    ,UIImage(systemName: "pencil.and.outline")
    ,UIImage(systemName: "house")
    ,UIImage(systemName: "gear")
    ,UIImage(systemName: "paintbrush.fill")
    ,UIImage(systemName: "music.note.list")
    ,UIImage(systemName: "dollarsign.circle")
    ,UIImage(systemName: "globe")
    ,UIImage(systemName: "plus.slash.minus")]


    override func viewDidLoad() {
        super.viewDidLoad()
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
        let dim = collectionView.bounds.width/2.1
        return CGSize(width: dim, height: dim)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ObjectViewController
        vc.ind = ind
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
