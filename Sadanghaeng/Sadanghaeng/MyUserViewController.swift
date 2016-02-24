//
//  MyUserViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 11..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class MyUserViewController: UIViewController {
    
    @IBOutlet weak var editTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
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
    
    @IBAction func logOutButtonTapped(sender: UIButton) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "로그아웃", message: "정말 로그아웃 하실건가요?ㅠㅠ", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "아니오", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "네", style: .Default) { action -> Void in
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("startControllerSegue") as! UINavigationController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        actionSheetController.addAction(nextAction)
        //Add a text field
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)

    }
    
    
}
