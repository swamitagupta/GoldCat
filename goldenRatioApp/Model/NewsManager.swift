//
//  NewsManager.swift
//  goldenRatioApp
//
//  Created by Swamita on 11/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import Foundation

protocol NewsManagerDelegate {
    func didUpdateNews(_ newsManager: NewsManager,news: FetchedModel)
    func didFailWithError(error: Error)
}

struct NewsManager{
    let newsURL = "https://gnews.io/api/v3/search?q=golden+ratio&token=85ec6eaf1a975c14f3aaf6b208c2706c"
    
    var delegate: NewsManagerDelegate?
    
    func fetchNews() {
        performRequest(with: newsURL)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                else {
                    if let safeData = data {
                        if let news = self.parseJSON(safeData){
                            self.delegate?.didUpdateNews(self, news: news)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ newsData: Data) -> FetchedModel? {
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(NewsData.self, from: newsData)
                
                var titles : [String] = []
                var descs : [String] = []
                var urls : [String] = []
                
                for i in 0...9 {
                    titles.append(decodedData.articles[i].title)
                    descs.append(decodedData.articles[i].description)
                    urls.append(decodedData.articles[i].url)
                }
                
                let title = decodedData.articles[0].title
                let description = decodedData.articles[0].description
                let url = decodedData.articles[0].url
                
                let fetchedNews = FetchedModel(titles: titles, descriptions: descs, urls: urls)
                return fetchedNews
                
            } catch {
                delegate?.didFailWithError(error: error)
                print(error)
                return nil
            }
        }
    }


