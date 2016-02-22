//
//  WriteViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 27..
//  Copyright © 2016년 GARIN. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController,UITextViewDelegate {
    
    let myPlaceholder = "글 내용을 입력해주세요."
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var myTextField: UITextView!
    @IBOutlet weak var postButton: UIBarButtonItem!
    
    // 로그로 내용 확인
    
    @IBAction func postButtonTapped(sender: UIBarButtonItem) {
        let title = titleField.text!
        let text = myTextField.text
        print("Title: \(title)")
        print("Text: \(text)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 다른 곳 탭하면 키보드 숨기기
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        myTextField.delegate = self
        myTextField.text = myPlaceholder
        myTextField.textColor = UIColor.lightGrayColor()
    }
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = myPlaceholder
            textView.textColor = UIColor.lightGrayColor()
        }
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
    
    
    // 키보드 숨기는 함수
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
}

