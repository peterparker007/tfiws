//
//  ViewController.swift
//  API Demo
//
//  Created by Shailendra Suriyal on 17/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var placeTextField: UITextField!
    
    @IBOutlet var weatherReportLabel: UILabel!
    
    @IBOutlet var detailedWeatherReport: UILabel!
    
    
    @IBAction func getWeatherButton(_ sender: Any) {
        
        if let place = placeTextField.text {
            
            let url = URL(string: ("http://api.openweathermap.org/data/2.5/weather?q="+place+"&appid= PLACE_YOUR_APP_ID ").replacingOccurrences(of: " ", with: "%20"))
            
            let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
                
                if error != nil {
                    
                    print("Unable to fetch Weather Details");
                    
                } else {
                    
                    if let jsonContent = data {
                        
                        do {
                            
                            let jsonWeather = try JSONSerialization.jsonObject(with: jsonContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            var weatherReport = " "
                            
                            if let report = ((jsonWeather["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                
                                weatherReport = "Weather :- \(report) \n"
                                
                                if let presssure = ((jsonWeather["main"] as? NSDictionary)?["pressure"])  {
                                    
                                    weatherReport += ("Pressure:- \(presssure) \n")
                                    
                                    
                                    if let temp = ((jsonWeather["main"] as? NSDictionary)?["temp"])  {
                                        
                                        weatherReport += ("Temperature:- \(temp) kelvin")
                                        
                                        DispatchQueue.main.sync(execute: {
                                            self.detailedWeatherReport.text = weatherReport
                                        })
                                    }
                                }
                                
                                
                            }
                            
                            
                            
                            
                        } catch {
                            
                        }
                        
                    }
                    
                }
                
            })
            
            task.resume();
        } else {
            
            self.detailedWeatherReport.text = "Couldn't find the weather for that city. Please Try Again!!!"
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=7c7fe461770bba8669a66613a69a6077")
//        
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            
//            if error != nil {
//                
//                
//                
//            } else {
//                
//                if let urlContent = data {
//                    
//                    do {
//                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                        
//                        //   print(jsonResult)
//                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
//                            print(description)
//                        }
//                    } catch {
//                        
//                        //processing failed
//                        print("Json Processing failed")
//                        
//                    }
//                    
//                }
//                
//            }
//            
//        }
//        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

