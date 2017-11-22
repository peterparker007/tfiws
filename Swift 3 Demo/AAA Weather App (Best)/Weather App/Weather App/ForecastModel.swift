//
//  ForecastModel.swift
//  Weather App
//
//  Created by Alex Koumparos on 24/11/16.
//  Copyright © 2016 Koumparos Software. All rights reserved.
//

import Foundation

enum Constants {
    static let baseUrl = "http://www.weather-forecast.com/locations/"
    static let urlTail = "/forecasts/latest"
    
    static let htmlSeparatorStart = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
    static let htmlSeparatorEnd = "</span></span></span></p><div class=\"forecast-cont\">"
}

class ForecastModel {
    
    static let sharedInstance = ForecastModel()
    private init() {}
    
    
     private func generateUrlString(withCity city: String) -> String {
        
        // get rid of any trailing whitespace that might have crept into the string
        let trimmedCity = city.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let formattedCity = trimmedCity.replacingOccurrences(of: " ", with: "-")
        return Constants.baseUrl + formattedCity + Constants.urlTail
    }
    
    private func generateUrl(withCity city: String) -> URL {
        return URL(string: generateUrlString(withCity: city))!
    }
    
    private func getHtml(fromUrl url: URL) -> String {
        
        var output: String = "No response yet received"
        
        // Create a URL request:
        let request = URLRequest(url: url)
        
        // Create a Url task:
        let task = URLSession.shared.dataTask(with: request) {
            
            data, response, error in
            /*
            print("data: \(data)")
            print("response: \(response)")
            print("error: \(error)")
            */
            guard error == nil else {
                output = "\(error)"
                return
            }
            
            if let unwrappedData = data {
                
                let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                //print("dataString: \(dataString)")
                
                output = String(describing: dataString)
                
                //print("output: \(dataString)")
                
                self.weatherFromRequest(weather: output)
            }
            
        }
        
        // Initiate the task
        task.resume()
        
        print("output: \(output)")
        return output
        
    }
    
    func getWeather(fromCity city: String) -> String {
        
        print("getting weather for \(city)...")
        
        let url = generateUrl(withCity: city)
        
        let html = getHtml(fromUrl: url)
        
        return html
        
    }
    
    func weatherFromRequest(weather: String) {
        print("weather is: \(weather)")
    }
    
}
