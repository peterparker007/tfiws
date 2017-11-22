//
//  ViewController.swift
//  shake it baby
//
//  Created by Sergio Díaz Navarro on 12/26/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake{
            
            let soundArray = ["guns", "cold", "justin"]
            let randomNumber = Int(arc4random_uniform(UInt32((soundArray.count))))
            let fileLocation = Bundle.main.path(forResource: (soundArray[randomNumber]), ofType: "mp3")
            print(randomNumber)
            
           
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                
                player.play()
                
            } catch {
                    
                    //
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

