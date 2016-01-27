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
    @IBOutlet weak var sendButton: UIButton!

    // 로그로 내용 확인
    @IBAction func sendButtonTapped(sender: UIButton) {
        let title = titleField.text!
        let text = myTextField.text
        print("Title: \(title)")
        print("Text: \(text)")
    }
    
}
