//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 5/27/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class BoardTableViewController: UITableViewController {
    // MARK: Properties
    
    var lists = [Board]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleLists()
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
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BoardTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BoardTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let list = lists[indexPath.row]
        
        cell.nameLabel.text = list.name
        cell.nickname.text = list.nickname
        //cell.photoImageView.image = list.photo

        
        return cell
    }
   }
