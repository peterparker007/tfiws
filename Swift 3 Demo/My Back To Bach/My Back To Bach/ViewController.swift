//
//  ViewController.swift
//  My Back To Bach
//
//  Created by Sergio Díaz Navarro on 12/26/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    var player = AVAudioPlayer()
    var time = Timer()
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    
    
    @IBAction func volumeSliderMoved(_ sender: Any) {
        
        player.volume = volumeSlider.value
    }
    
    @IBAction func sliderTimeMoved(_ sender: Any) {
        
        player.currentTime = TimeInterval(timeSlider.value)
    }
    
    func updateScrubber(){
        
        timeSlider.value = Float(player.currentTime)
    }

    
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        timeSlider.value = 0
        time.invalidate()
        player.pause()
        player.currentTime = 0
    }

    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        time.invalidate()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "coldplay", ofType: "mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            volumeSlider.maximumValue = Float(player.duration)
            
            
        } catch {
            
            // Process any errors
            
        }

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

