//
//  RegisterViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 24..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailInputField: UITextField!
    @IBOutlet weak var pwInputField: UITextField!
    @IBOutlet weak var pwConfirmField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션바 투명
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(),forBarMetrics: .Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func registerButtonTapped(sender: UIButton) {
        
        
            if (emailInputField.text!.isEmpty) {
                let alert = UIAlertController(title: "이멜 입력해주세요!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alert, animated:true, completion:nil)
                return;
            }else{
                if (pwInputField.text!.isEmpty) {
                    let alert = UIAlertController(title: "비밀번호를 입력해주세요!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alert, animated:true, completion:nil)
                    return;
                } else {
                    if (pwConfirmField.text!.isEmpty) {
                        print("ss")
                        let alert = UIAlertController(title: "비밀번호 확인을 입력해주세요!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel, handler: nil))
                        self.presentViewController(alert, animated:true, completion:nil)
                        return;
                    } else {
                                        print("ok")
                                        let alert = UIAlertController(title: "이메일 발송 완료!", message: "이메일을 확인해주세요", preferredStyle: UIAlertControllerStyle.Alert)
                        
                                        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: .Default) { action -> Void in
                                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                            let vc:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("startControllerSegue") as! UINavigationController
                                            self.presentViewController(vc, animated: true, completion: nil)
                                        }
                                        alert.addAction(okAction)
                                        self.presentViewController(alert, animated:true, completion:nil)
                    }
                }

                /*처음 isEmpty 끝*/
            }
            /*맨 처음 if문 끝*/
        }
    }
    

