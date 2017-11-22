//
//  ViewController.swift
//  API Demo
//
//  Created by Rob Percival on 21/06/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=gujrat,india&appid=5e3c28bbcfe1a75a5559e166e47518de")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in // URLSession.shared().dataTask(with: url) { (data, response, error) is now URLSession.shared.dataTask(with: url) { (data, response, error)
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject

                        print(jsonResult)
                        
                        //print(jsonResult["name"])


                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                            print("Description: " + description)
                            
                        }
                        
                        
                        
                        
                    } catch {
                        
                        print("JSON Processing Failed")
                        
                    }
                    
                }
                
                
            }
            
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

