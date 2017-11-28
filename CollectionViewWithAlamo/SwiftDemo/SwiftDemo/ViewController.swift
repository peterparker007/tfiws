//
//  ViewController.swift
//  SwiftDemo
//
//  Created by bhumesh on 11/28/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class CollectionVWCell: UICollectionViewCell {
    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var lblName: UILabel!
    
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    @IBOutlet var collectionVW: UICollectionView!
    var arrData:NSArray = [String]() as NSArray

    override func viewDidLoad() {
        super.viewDidLoad()
        self .getData()
        // Do any additional setup after loading the view, typically from a nib.
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
                    self.collectionVW.reloadData()
                }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = self.collectionVW .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionVWCell
      //  let cell = self.collectionVW dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionVWCell
//       cell.lblName.text = "Apple"
//        cell.imgvw.image = #imageLiteral(resourceName: "Untitled.png")
        
        let Dict = self.arrData[indexPath.row] as! NSDictionary
        cell.lblName.text = Dict["name"] as? String
        
        cell.imgvw .sd_setImage(with: URL(string: (Dict["image_url"] as? String)!), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding:Float = 10
        var cellsize:Float = Float(self.collectionVW.frame.size.width)
         cellsize = (cellsize - padding) as Float
       
        return CGSize(width: CGFloat(Float(cellsize / 2)),height:  CGFloat(Float(cellsize * 0.65)))
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData.count;
    }
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1;
//    }

}

