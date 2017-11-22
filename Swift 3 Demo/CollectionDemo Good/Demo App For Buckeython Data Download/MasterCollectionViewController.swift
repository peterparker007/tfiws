//
//  MasterCollectionViewController.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/28/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

private let reuseIdentifier = "leaderCell"

class MasterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate var leaders = [Leader]()
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populateData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaders.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionViewCell {
        
            cell.configureCell(leader: leaders[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leader = leaders[indexPath.row]
        performSegue(withIdentifier: "toDetailedView", sender: leader)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 200.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func populateData() {
        guard let url = Bundle.main.url(forResource: "leadership_team", withExtension: "json", subdirectory: nil, localization: nil) else { return }
        if let data = NSData(contentsOf: url) {
            do {
             if let object = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [ String:AnyObject ] {
                    if let leaders = object["leaders"] as? [Dictionary<String, String>] {
                        for (_, element) in leaders.enumerated() {
                            let leaderOne = Leader(leaderData: element as AnyObject?)
                            self.leaders.append(leaderOne)
                        }
                    }
                }
            } catch {
                print("Error")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetailedView") {
            if let viewController = segue.destination as? DetailedViewController {
                if let data = sender as? Leader {
                    viewController.leader = data
                    viewController.title = data.Name
                }
            }
        }
    }
}

