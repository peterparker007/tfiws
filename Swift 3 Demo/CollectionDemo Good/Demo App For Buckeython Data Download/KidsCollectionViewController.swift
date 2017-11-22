//
//  KidsCollectionViewController.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/31/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

private let reuseIdentifier = "kidCell"

class KidsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var kids = [Kid]()
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kids"
        self.populateData()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return kids.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? KidsCollectionViewCell {
            
            cell.configureCell(kid: kids[indexPath.row])
            return cell
        }
    
        return UICollectionViewCell()
    }
    
    func populateData () {
        guard let url = Bundle.main.url(forResource: "kids", withExtension: "json", subdirectory: nil, localization: nil) else { return }
        if let data = NSData(contentsOf: url) {
            do {
                if let objects = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [ Dictionary<String,String> ] {
                        for (_, object) in objects.enumerated() {
                            let kid = Kid(data: object)
                            self.kids.append(kid)
                        }
                }
            } catch {
                print("Error")
            }
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 220.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let kid = kids[indexPath.row]
        performSegue(withIdentifier: "toDetailedKidView", sender: kid)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetailedKidView") {
            if let viewController = segue.destination as? DetailedKidViewController {
                if let data = sender as? Kid {
                    viewController.kid = data
                    viewController.title = data.name
                }
            }
        }
    }
}
