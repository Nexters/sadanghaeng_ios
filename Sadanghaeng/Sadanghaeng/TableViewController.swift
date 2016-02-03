//
//  TableViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 2..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var objects:NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        Alamofire.request(PostRouter.ReadPosts(["sortBy": "createdAt"]))
            .responseJSON { response in
                if let jsonResult = response.result.value {
                    print(jsonResult)
                    for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                        let title = anItem["title"] as! String
                        
                        self.objects.addObject(title)
                        self.tableView.reloadData()
                    }
                }
        }
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.titleLabel.text = self.objects.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showView")
        {
            var upcoming: NewViewController = segue.destinationViewController as! NewViewController
            
            let indexPath = self.tableView.indexPathsForSelectedRows!
            
//            let titleString = self.objects.objectAtIndex(indexPath.row) as? String
//            
//            upcoming.titleString = titleString
//            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
}
