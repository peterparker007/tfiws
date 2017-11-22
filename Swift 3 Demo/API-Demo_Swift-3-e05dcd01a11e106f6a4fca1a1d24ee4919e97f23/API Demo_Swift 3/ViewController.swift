//
//  ViewController.swift
//  API Demo_Swift 3
//
//  Created by johannes Mhembere on 9/9/16.
//  Copyright © 2016 mhofu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=dallas,uk&appid=d96a7f9cb0267643080df80051f81c08")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    print(jsonResult)
                        
                        print(jsonResult["name"])
                        
                    } catch {
                        
                        print("JSON Processing Failed")
                    }
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    

}














