//
//  DetailedViewController.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/29/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var leader : Leader!
    
    @IBOutlet weak var leaderImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var detailed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTheView()
    }
    
    func configureTheView () {
        self.name.text = leader.Name
        self.role.text = leader.Role
        self.email.text = leader.Email
        
        if leader.Detail != nil {
            self.detailed.text = leader.Detail
        } else {
            self.detailed.text = ""
        }
        
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
