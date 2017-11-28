//
//  ViewController.swift
//  Alamofire
//
//  Created by bhumesh on 11/16/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class tablevwCell: UITableViewCell {
    @IBOutlet var imgVW: UIImageView!
    @IBOutlet var itemName: UILabel!
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var arrData : NSArray = [String]() as NSArray
    //var array = [String]()
    @IBOutlet var tblvw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getData()
    {
        let data = [
            "api_key" : "ICXE1wOphgKgcyMoHr0hVHbbJ",
            "catid" : "19",
            "pageno" : "1"
        ]
        Alamofire.request("http://192.168.15.198/magento_sample/web2/categoryAssignedProdList.php", method: .post, parameters: data, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                if let JSON = response.result.value as? [String: Any] {
                    let message = JSON["message"] as! String
                    print(message)
                     self.arrData = JSON["data"] as! NSArray
                    print(self.arrData)
                    self.tblvw.reloadData()
                }
        }
        
        
        
        
        
        
        
        //print(person["data"] as! String)
    }
    
    //                if let array = response.result.value as? [[String: Any]] {
    //                    //If you want array of task id you can try like
    //                    self.array = array.flatMap { $0["data"] as? String }
    //                    print( self.array)
    //                    self.tblvw.reloadData()
    //                }
    
    //to get JSON return value
    //                if let result = response.result.value {
    //                    let JSON = result as! NSDictionary
    //                    print(JSON.value(forKey: "data"))
    //                    self.array = JSON.value(forKey: "data") as! [String]
    //
    //                }
    
    
    
    
    
    
    //       Alamofire.request("http://192.168.15.198/magento_sample/web2/categoryAssignedProdList.php", method: .post, parameters: data, encoding: URLEncoding.httpBody).responseJSON
    //        {response in
    //            if let json = response.result.value as? [String: Any]
    //            {
    //
    //                let dicJson = json as NSDictionary
    //                print(dicJson)
    //
    //                self.arr = dicJson .value(forKey: data) as [[String:AnyObject]]
    //            }
    
    
    // }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:tablevwCell! = tblvw.dequeueReusableCell(withIdentifier: "tablevwCell") as! tablevwCell?
        
        
         let dict = self.arrData[indexPath.row] as! NSDictionary
        cell.itemName.text = dict["name"] as? String
       
        
        cell.imgVW.sd_setImage(with: URL(string: (dict["thumbnail_imageurl"] as? String)!), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count;
        //    return  self.array.count;
    }
}

