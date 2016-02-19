//
//  KeyboardContraintController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 18..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class KeyboardContraintController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
        override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:
            UIKeyboardWillHideNotification, object: nil)
            
        /////
        textView.text = "다가서지 못하고 헤매이고 있어\n좋아하지만 다른 곳을 보고 있어\n가까워지려고 하면 할수록\n멀어져 가는 우리 둘의 마음처럼\n\n만나지 못해 맴돌고 있어\n우린 마치 평행선처럼\n말도 안 돼 우린 반드시 만날 거야\n기다릴게 언제까지나"
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSizeMake(fixedWidth,CGFloat.max))
        var newFrame = textView.frame
        newFrame.size = CGSizeMake(max(newSize.width,fixedWidth), newSize.height)
        textView.frame = newFrame
    }
    override func viewDidLayoutSubviews() {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSizeMake(fixedWidth, CGFloat.max))
        var newFrame = textView.frame
        newFrame.size = CGSizeMake(max(newSize.width, fixedWidth), newSize.height)
        textView.frame = newFrame
    }

    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }
    
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        // 3
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        // 4
        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 0) * (show ? 1 : -1)
        //5
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant += changeInHeight
        })
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    

}
