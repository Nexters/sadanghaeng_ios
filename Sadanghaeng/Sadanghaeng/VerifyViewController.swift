//
//  VerifyViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 29..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController {
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
