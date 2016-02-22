//
//  MyUserViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 11..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class MyUserViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var editTextField: CustomTextField!
    @IBOutlet weak var myTableView: UITableView!
    
    let select:[String] = ["내가 쓴 글","내가 쓴 댓글"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        myTableView.dataSource = self
        
        // 테이블 row가 아닌건 안보이게
        let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10))
        tableViewFooter.backgroundColor = UIColor.clearColor()
        myTableView.tableFooterView = tableViewFooter
        myTableView.scrollEnabled = false
    }
    
    override func viewWillAppear(animated: Bool) {
        // custom navigation bar
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 253/255, green: 64/255, blue: 55/255, alpha: 1)
    }
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.translucent = false
        
        let img = UIImage()
        // Remove Shadow
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 253/255, green: 64/255, blue: 55/255, alpha: 1)
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
    
    
    @IBAction func EditButtonTapped(sender: AnyObject) {
        
        if (editTextField.text == ""){
            let nullalert = UIAlertController(title: "닉네임을 입력해주세요!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            
            nullalert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel, handler: nil))
            
            self.presentViewController(nullalert, animated:true, completion:nil)
            return;
        }else {
            let alert = UIAlertController(title: "닉네임 수정 완료", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated:true, completion:nil)
        }

        
    }
    
}
