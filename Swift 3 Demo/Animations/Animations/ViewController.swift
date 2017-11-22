//
//  ViewController.swift
//  Animations
//
//  Created by Sergio Díaz Navarro on 12/12/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var startLabel: UIButton!
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y:0 , width:0 , height:0)
        
        UIView.animate(withDuration:1){
            self.image.frame = CGRect(x: 0, y:0 , width:200 , height:200)

        }
    }
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x:image.center.x - 500 , y: image.center.y )
        
        UIView.animate(withDuration:0.2){
            self.image.center = CGPoint(x:self.image.center.x + 500 , y: self.image.center.y)
        }
    }

    var timer = Timer()
    var isAnimating = false
    var iCont = 0;

    
    func animate(){
        
        iCont+=1;
        
        if(iCont > 6){
            iCont = 0
        }
        
        image.image = UIImage(named: "frame_" + String(iCont) + "_delay-0.08s.gif")
    }
    
    @IBAction func next(_ sender: Any) {
        
        isAnimating = !isAnimating
        
        if(isAnimating){
            
            startLabel.setTitle("Stop", for: .normal)

            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate) , userInfo: nil, repeats: true)
        } else{
            startLabel.setTitle("Start", for: .normal)
            timer.invalidate()
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

