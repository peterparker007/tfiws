//
//  SponsorCollectionViewCell.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/30/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class SponsorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sponsorImage : UIImageView!
    
    func configureCell(image: String) {
        if let url = URL(string : image) {
            self.sponsorImage.contentMode = .scaleAspectFit
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
                self.sponsorImage.image = UIImage(data: data)
            }
        }
    }
}
