//
//  MyTableView.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 27..
//  Copyright © 2016년 GARIN. All rights reserved.
//

import UIKit

class MyTableView: UITableViewController {
    
    var MyArray : Array<String> = ["하나","둘","셋"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let testData: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("userId") {
            print(testData)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        cell.textLabel?.text = MyArray[indexPath.row]
        return cell
    }
}
