//
//  CommentViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 4..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var commentTableView: UITableView!
    let comments:[String] = ["안녕 길게 써야지!!!!길게길게","퇴근하고 싶어요 퇴근좀😂"]
    let names:[String] = ["유저1","유저2"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = comments.count
        return returnValue
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "commentCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as!CommentTableViewCell
        
        //let list = comments[indexPath.row]
        
        cell.comment.text = comments[indexPath.row]
        return cell
    }
}
