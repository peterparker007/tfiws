//
//  SecondViewController.swift
//  Advanced Segues
//
//  Created by Sergio Díaz Navarro on 12/19/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var username =  "SECOND"
    var activeRow = 0

    
    @IBOutlet weak var rowLabel: UILabel!
    
    
    
    func displayText(){
        
        rowLabel.text = String(activeRow)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayText()
        
        print("Active row " + String(activeRow))
        

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
