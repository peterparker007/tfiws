//
//  ViewController.swift
//  Weather App
//
//  Created by Alex Koumparos on 24/11/16.
//  Copyright © 2016 Koumparos Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    // ------------------
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var weatherLabel: UILabel!
    // MARK: - VC Methods
    // ------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cityTextField.delegate = self
        
        /*
        
        let weather = ForecastModel.sharedInstance.getWeather(fromCity: "San Francisco")
        
        print("weather: \(weather)")
        
        */
        
        /*
         if all logic was in the view controller:
         */
        /*
        let url = URL(string: "http://www.weather-forecast.com/locations/San-Francisco/latest")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard error == nil else {
                print(error)
                return
            }
            
            if let unwrappedData = data {
                
                let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                
                print(dataString)
                
            }
            
        }
        
        task.resume()
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Other Methods
    // ---------------------
    
    // Dismiss keyboard when tapping away from it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Update model with city
    // string then
    // Dismiss keyboard when pressing return
    // then clear text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text else {
            weatherLabel.text = "Error: no text in textfield"
            return true
        }
        
        guard textField.text != "" else {
            weatherLabel.text = "Error: no text in textfield"
            return true
        }
        
        let url = makeUrl(fromString: text)
        
        let html = getHtml(atUrl: url)
        
        //textField.text = html
        
        return true
        
    }
    
    func makeUrl(fromString str: String) -> URL {
        
        // eliminate any trailing whitespace that might have crept into the string
        let trimmedString = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let formattedString = trimmedString.replacingOccurrences(of: " ", with: "-")
        
        let fullString = Constants.baseUrl + formattedString + Constants.urlTail
        
        print("fullString: \(fullString)")
        
        return URL(string: fullString)!
        
    }
    
    func getHtml(atUrl url: URL) -> String {
        
        var output = ""
        
        // Create a URL request:
        let request = URLRequest(url: url)
        
        // Create a Url task:
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
        
            (data, response, error) in
            
            print ("---------------------------------")
            print ("data: \(data)")
            print ("---------------------------------")
            print ("response: \(response)")
            print ("---------------------------------")
            print ("error: \(error)")
            print ("---------------------------------")
            
            guard error == nil else {
                output = "error in getting html from server: \(error)"
                return
            }
            
            if let unwrappedData = data {
                
                let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                
                let forecast = self.forecastFrom(html: "\(dataString)")
                
                output = forecast
                
                DispatchQueue.main.sync(execute: {
                    
                    self.weatherLabel.text = output
                    
                })
                
            }
            
        })
        
        // Initiate the task
        task.resume()
        
        return output
        
    }
    
    func forecastFrom(html: String) -> String {
        
        let firstLevelSeparated = html.components(separatedBy: Constants.htmlSeparatorStart)
        
        guard firstLevelSeparated.count > 1 else {
            
            if firstLevelSeparated[0].contains("404.html") {
                print("=============\n\(firstLevelSeparated)\n=======")
                return "Error: City not found (server returned 404). Please check the spelling of the city and try again. Note, not all cities are represented by the weather service."
                
            }
            print("=============\n\(firstLevelSeparated)\n=======")
            return "Error: malformed html (unable to split html by expected string). The server returned a response but it was not in the expected format. The API might have changed."
        }
        
        let secondLevelSeparated = firstLevelSeparated[1].components(separatedBy: Constants.htmlSeparatorEnd)
        
        var weatherString = secondLevelSeparated[0]
        
        // may need to find and replace html characters (e.g., &amp;)
        
        // replace &deg; with degree symbol
        weatherString = weatherString.replacingOccurrences(of: "&deg;", with: "°")
        
        return weatherString
        
    }


}

