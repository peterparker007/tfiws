//
//  CustomCollectionViewCell.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/28/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var leaderImage : UIImageView!
    @IBOutlet weak var name : UILabel!
    
    override func awakeFromNib() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
    }
    
    func configureCell(leader : Leader) {
        name.text = leader.Name
        if let url = URL(string : leader.Image) {
            self.leaderImage.contentMode = .scaleAspectFit
            self.downloadImage(url: url)
        }
    }
    
    // Get data from the Image url
    
    func getDataFromURL(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    // Download the image
    
    func downloadImage(url: URL) {
        getDataFromURL(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.leaderImage.image = UIImage(data: data)
            }
        }
    }
}
