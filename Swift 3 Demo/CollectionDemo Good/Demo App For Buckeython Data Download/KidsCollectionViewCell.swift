//
//  KidsCollectionViewCell.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/31/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

struct Kid {
    var name : String!
    var friendly : String!
    var image : String!
    var birthday : String!
    
    init(data : Dictionary<String, String>) {
        if let name = data["name"] {
            self.name = name
        }
        if let friendly = data["friendly"] {
            self.friendly = friendly
        }
        if let image = data["image"] {
            self.image = image
        }
        if let birthday = data["birthday"] {
            self.birthday = birthday
        }
    }
}

class KidsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var kidImage : UIImageView!
    @IBOutlet weak var name : UILabel!
    
    func configureCell(kid : Kid) {
        self.name.text = kid.name
        if let url = URL(string : kid.image) {
            self.kidImage.contentMode = .scaleAspectFit
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
                self.kidImage.image = UIImage(data: data)
            }
        }
    }
}
