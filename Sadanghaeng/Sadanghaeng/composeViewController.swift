//
//  composeViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 26..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class composeViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!

    @IBAction func saveButtonTapped(sender: UIButton) {
        let title = titleTextField.text!
        let contents = myTextView.text
        print("Title: \(title)")
        print("Contents View: \(contents)")
    }
}
