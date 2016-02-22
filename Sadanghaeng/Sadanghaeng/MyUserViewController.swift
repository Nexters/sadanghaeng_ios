//
//  MyUserViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 11..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class MyUserViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myTableView: UITableView!
    
    let select:[String] = ["내가 쓴 글","내가 쓴 댓글"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        myTableView.dataSource = self
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let returnValue = select.count
        return returnValue
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell:UITableViewCell = myTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        myCell.textLabel?.text = select[indexPath.row]
        return myCell
    }
    
    
}
