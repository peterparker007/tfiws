//
//  DashboardVW.swift
//  MenuDemo
//
//  Created by bhumesh on 11/30/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit

class DashboardVW: UIViewController, SSASideMenuDelegate {

    @IBOutlet var btnleftMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SSASideMenu") as! SSASideMenu
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = redViewController
               
        
        view.backgroundColor = UIColor.white
        title = "Home"
         btnleftMenu.addTarget(self, action: #selector(SSASideMenu.presentLeftMenuViewController), for: .touchUpInside)
        print(self.navigationController)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnMenuTapped(_ sender: AnyObject) {
       
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
