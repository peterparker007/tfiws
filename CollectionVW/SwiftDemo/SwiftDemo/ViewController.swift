//
//  ViewController.swift
//  SwiftDemo
//
//  Created by bhumesh on 11/28/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit
class CollectionVWCell: UICollectionViewCell {
    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var lblName: UILabel!
    
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    @IBOutlet var collectionVW: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = self.collectionVW .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionVWCell
      //  let cell = self.collectionVW dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionVWCell
       cell.lblName.text = "Apple"
        cell.imgvw.image = #imageLiteral(resourceName: "Untitled.png")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding:Float = 10
        var cellsize:Float = Float(self.collectionVW.frame.size.width)
         cellsize = (cellsize - padding) as Float
       
        return CGSize(width: CGFloat(Float(cellsize / 2)),height:  CGFloat(Float(cellsize * 0.65)))
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1;
//    }

}

