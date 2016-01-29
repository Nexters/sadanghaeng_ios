//
//  WriteViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 27..
//  Copyright © 2016년 GARIN. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
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
    }
    
    // 키보드 숨기는 함수
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

