//
//  ViewController.swift
//  Demo
//
//  Created by zhuguangyang on 2016/12/30.
//  Copyright © 2016年 GYJade. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bookUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "book", ofType: nil)!)
        let bookData = try? Data(contentsOf: bookUrl)
        
        let json = try! JSONSerialization.jsonObject(with: bookData!, options: JSONSerialization.ReadingOptions.allowFragments)
        
        let tmp = Mapper<BookModel>().map(JSON: json as! [String : Any])
        
        print(tmp?.alt ?? "")
        print(tmp?.id ?? "")
        print(tmp?.pubdate ?? "")
        print(tmp?.subtitle ?? "")
        print(tmp?.gyTest ?? "1")
        print(tmp?.author?[0].name ?? "")
        debugPrint(tmp?.desp ?? "")
//        debugPrint(tmp?.alt)
    
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

