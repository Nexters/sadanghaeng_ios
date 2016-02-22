//
//  SegmentedViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 4..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class SegmentedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    var lists = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleLists()
        // 테이블 row가 아닌건 안보이게
        var tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10))
        tableViewFooter.backgroundColor = UIColor.clearColor()
        myTableView.tableFooterView = tableViewFooter
        
    }
    
    func loadSampleLists() {
        //let photo1 = UIImage(named: "meal1")!
        let list1 = Board(name: "글이 업쏘", nickname: "구경꾼")!
        
        //let photo2 = UIImage(named: "meal2")!
        let list2 = Board(name: "맥북 좋앙😊", nickname: "apple")!
        
        //let photo3 = UIImage(named: "meal3")!
        let list3 = Board(name: "밥줘라 밥", nickname: "가으리멍멍")!
        
        lists += [list1, list2, list3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.translucent = false
        
        let img = UIImage()
        // Remove Shadow
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        // navigation Bar Color
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch(mySegmentedControl.selectedSegmentIndex)
        {
        case 0:
            returnValue = lists.count
            break
        case 1:
            returnValue = lists.count
            break
        default:
            break
        }
        
        return returnValue
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "myCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! SegTableViewCell
        
        //myCell.textLabel.text
        
        let list = lists[indexPath.row]
        switch(mySegmentedControl.selectedSegmentIndex)
        {
        case 0:
            cell.nameLabel.text = list.name
            cell.nickname.text = list.nickname
            break
        case 1:
            cell.nameLabel.text = list.name
            cell.nickname.text = list.nickname
            break
        default:
            break
        }
        return cell
    }
    
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        myTableView.reloadData()
    }
}
