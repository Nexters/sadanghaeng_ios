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
    @IBOutlet weak var postButton: UIButton!
    
    var lists = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleLists()
        // 테이블 row가 아닌건 안보이게
        let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10))
        tableViewFooter.backgroundColor = UIColor.clearColor()
        myTableView.tableFooterView = tableViewFooter
        
        // 플로팅 버튼 쉐도우 추가
        postButton.layer.shadowOpacity = 0.7
        postButton.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        postButton.layer.shadowRadius = 5.0
    }
    
    func loadSampleLists() {
        //let photo1 = UIImage(named: "meal1")!
        let list1 = Board(name: "글이 업쏘", nickname: "구경꾼")!
        
        //let photo2 = UIImage(named: "meal2")!
        let list2 = Board(name: "맥북 좋앙😊", nickname: "apple")!
        
        //let photo3 = UIImage(named: "meal3")!
        let list3 = Board(name: "밥줘라 밥", nickname: "가으리멍멍")!
        let list4 = Board(name: "아 왜 안돼", nickname: "ㅁ")!
        let list5 = Board(name: "스크롤 생겨라", nickname: "ㅎ")!

        let list6 = Board(name: "뀽아앙", nickname: "ㅇㅇㅇ")!

        let list7 = Board(name: "졸려", nickname: "ww")!

        
        lists += [list1, list2, list3, list4,list5,list6,list7]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.translucent = false
        
        let img = UIImage()
        // Remove Shadow
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        // navigation Bar Color
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blackColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
        UIBarButtonItem.appearance().tintColor = UIColor.redColor()

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
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blackColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
        UIBarButtonItem.appearance().tintColor = UIColor.redColor()
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
