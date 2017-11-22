//
//  SponsorTableViewCell.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/30/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class SponsorTableViewCell: UITableViewCell {

    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var sponsorTitle: UIView!
    @IBOutlet weak var collection: UICollectionView!
    
    fileprivate var sponors = [Dictionary<String, String>]()
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    
    
    override func awakeFromNib() {
        self.collection.delegate = self
        self.collection.dataSource = self
    }
    
    func configureCell(data : Dictionary<String, AnyObject>, viewColor : CGColor) {
        if let title = data["category"] as? String {
            self.title.text = title
        }
        
        if let sponsorData = data["sponsors"] as? [Dictionary<String, String>] {
            self.sponors = sponsorData
        }
        
        self.sponsorTitle.layer.backgroundColor = viewColor
        
        collection.reloadData()
    }
}

extension SponsorTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sponors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sponsorCell", for: indexPath) as? SponsorCollectionViewCell {
            
            let imageName = sponors[indexPath.row]
            
            if let imageLink = imageName["image"] {
                cell.configureCell(image: imageLink)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sponsor = sponors[indexPath.row]
        if let url = sponsor["link"] {
            if let link = URL(string: url) {
                UIApplication.shared.open(link, options: [:], completionHandler: nil)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
