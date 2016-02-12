//
//  ViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 27..
//  Copyright © 2016년 GARIN. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let userId = "test"
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(userId, forKey: "userId")
        userDefaults.synchronize()
        
        if let testData: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("userId") {
            print(testData)
        }
        
        
        Alamofire.request(PostRouter.ReadPosts(["sortBy": "createdAt"]))
            .responseJSON { response in
                if let jsonResult = response.result.value {
                    print(jsonResult)
                    for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                        let title = anItem["title"] as! String
                        print(title)
                    }
                }
        }
        ////////////keyboard move up

        ////////////
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }
    

    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}

