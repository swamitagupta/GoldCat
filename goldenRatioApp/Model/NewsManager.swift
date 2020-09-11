//
//  NewsManager.swift
//  goldenRatioApp
//
//  Created by Swamita on 11/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import Foundation
/*
protocol WeatherManagerDelegate {
    
}

struct NewsManager{
    let newsURL = "https://gnews.io/api/v3/search?q=golden+ratio&token=85ec6eaf1a975c14f3aaf6b208c2706c"
    
    var delegate: NewsManagerDelegate?
    
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
                        if let weather = self.parseJSON(safeData){
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ NewsData: Data) -> NewsModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(NewsData.self, from: NewsData)
            
            
            
            let title =decodedData.
            let description = decodedData.weather[0].description
            let temp = decodedData.main.temp
            let name = decodedData.name
            let temp_min = decodedData.main.temp_min
            let temp_max = decodedData.main.temp_max
            let speed = decodedData.wind.speed
            let deg = decodedData.wind.deg
            let hum = decodedData.main.humidity
            let pre = decodedData.main.pressure
            let vis = decodedData.visibility
            let country = decodedData.sys.country
            let sunrise = decodedData.sys.sunrise
            let sunset = decodedData.sys.sunset
            
            
            let news = NewsModel(title: <#T##String#>, description: <#T##String#>, image: <#T##UIImage#>, url: <#T##String#>, time: <#T##String#>)
            return news
            
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}
*/
