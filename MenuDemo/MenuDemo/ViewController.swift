//
//  ViewController.swift
//  MenuDemo
//
//  Created by bhumesh on 11/30/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSubmitTapped(_ sender: AnyObject) {

        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "DashboardVW") as! DashboardVW
        let nav = UINavigationController(rootViewController: homeViewController)
        appdelegate.window!.rootViewController = nav
    //    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SSASideMenu") as! SSASideMenu
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = redViewController
//       
//        self.navigationController?.pushViewController(redViewController, animated: true)
        //self.present(redViewController, animated: true, completion: nil)
    }

}

