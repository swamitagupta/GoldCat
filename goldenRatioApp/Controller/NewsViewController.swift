//
//  NewsViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 11/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController, NewsManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var newsManager = NewsManager()
    
    var titles : [String] = []
    var descs : [String] = []
    var urls : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        newsManager.delegate = self
        newsManager.fetchNews()
    }
    
    func didUpdateNews(_ newsManager: NewsManager, news: NewsModel) {
        DispatchQueue.main.async{
            for i in 1...10 {
                self.titles.append(news.title)
                self.descs.append(news.description)
                self.urls.append(news.url)
                self.tableView.reloadData()
            }
            
        }
            
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
        let alert = UIAlertController(title: "Error", message: "Unable to load, please try later!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Okay", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.title.text = titles[indexPath.row]
        cell.descriptionLabel.text = descs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func readArticle(_ site: String) {
        if let url = URL(string: site) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        readArticle(urls[indexPath.row])
    }
}
