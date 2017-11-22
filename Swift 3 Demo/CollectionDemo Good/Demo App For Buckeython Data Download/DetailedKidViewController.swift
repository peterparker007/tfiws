//
//  DetailedKidViewController.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/31/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class DetailedKidViewController: UIViewController {
    
    var kid : Kid!

    @IBOutlet weak var kidImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.name.text = kid.name
        self.birthday.text = kid.birthday
        
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
