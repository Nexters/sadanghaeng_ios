//
//  SegmentedViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 4..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit
import Alamofire

class SegmentedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var postButton: UIButton!
    
    var lists = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadPostLists()
        // 테이블 row가 아닌건 안보이게
        let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10))
        tableViewFooter.backgroundColor = UIColor.clearColor()
        myTableView.tableFooterView = tableViewFooter
        
        // 플로팅 버튼 쉐도우 추가
        postButton.layer.shadowOpacity = 0.5
        postButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        postButton.layer.shadowRadius = 5.0
    }
    
    func loadPostLists() {
        print("==========")
        print(User.userId)
        Alamofire.request(UnivRouter.ReadUnivPosts("56d06fe2666912b04fc99563",["univid": "56d06fe2666912b04fc99563", "filter": "new", "page": 1, "perPage": 7]))
            .responseJSON { response in
                if let jsonPreResult = response.result.value {

                    let jsonResult = jsonPreResult["value"] as! [Dictionary<String, AnyObject>]
                    
                    for anItem in jsonResult {
                        let title = anItem["title"] as! String
                        let author = anItem["author"] as! String
                        let listItem = Board(name: title, nickname: author)!
                        
                        self.lists.append(listItem)
                    }
                    self.myTableView.reloadData();
                }
        }

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
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blackColor()]
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
