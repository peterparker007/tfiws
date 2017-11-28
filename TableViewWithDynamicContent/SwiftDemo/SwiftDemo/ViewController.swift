//
//  ViewController.swift
//  SwiftDemo
//
//  Created by bhumesh on 11/22/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit
class tblvwCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var imgvw: UIImageView!
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "tblvwCell", for: indexPath) as! tblvwCell
        cell.name.text = "bhumesh"
        cell.imgvw.image = #imageLiteral(resourceName: "iPhone.png")
        cell.imgvw.layer.borderWidth = 1.0
        cell.imgvw.layer.masksToBounds = false
        cell.imgvw.contentMode = UIViewContentMode.scaleAspectFill
        cell.imgvw.layer.borderColor = UIColor.blue.cgColor
        cell.imgvw.layer.cornerRadius = cell.imgvw.frame.size.width/2
        cell.imgvw.clipsToBounds = true
        
        //configure your cell
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

