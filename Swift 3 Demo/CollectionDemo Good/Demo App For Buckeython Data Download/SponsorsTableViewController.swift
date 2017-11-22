//
//  SponsorsTableViewController.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/30/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class SponsorsTableViewController: UITableViewController {
    
    fileprivate var sponsors = [Dictionary<String, AnyObject>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Sponsors"
        self.populateData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sponsors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var color : CGColor!
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sponsorTable", for: indexPath) as? SponsorTableViewCell {
            
            if indexPath.row % 2 == 0 {
                color = UIColor(colorLiteralRed: 187/255, green: 0, blue: 0, alpha: 1).cgColor
            } else {
                color = UIColor(colorLiteralRed: 102/255, green: 102/255, blue: 102/255, alpha: 1).cgColor
            }
            
            cell.configureCell(data: sponsors[indexPath.row], viewColor: color)
            
            return cell
        }

        return UITableViewCell()
    }
    
    func populateData() {
        guard let url = Bundle.main.url(forResource: "partners", withExtension: "json", subdirectory: nil, localization: nil) else { return }
        if let data = NSData(contentsOf: url) {
            do {
                if let object = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [ String : AnyObject ] {
                    if let sponsors = object["partners"] as? [Dictionary<String, AnyObject>] {
                        for (_, element) in sponsors.enumerated() {
                            self.sponsors.append(element)
                        }
                    }
                }
            } catch {
                print("Error")
            }
        }
    }

}
