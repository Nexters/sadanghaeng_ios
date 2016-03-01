//
//  VerifyViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 29..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

//
//  ViewController.swift
//  InterfaceBuilderExample
//
//  Created by Honghao Zhang on 2015-09-10.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import UIKit
import Alamofire
import AutoKeyboardScrollView

class LoginViewController: UIViewController {
    

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var wrapperView: UIView!
    var scrollView = AutoKeyboardScrollView()
    var views = [String: UIView]()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(),forBarMetrics: .Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
    }
    
    func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Remove from super to remove all self constraints
        wrapperView.removeFromSuperview()
        
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        // Be sure to add subviews on contentView
        scrollView.contentView.addSubview(wrapperView)
        
        scrollView.backgroundColor = wrapperView.backgroundColor
        scrollView.userInteractionEnabled = true
        scrollView.bounces = true
        scrollView.scrollEnabled = true
        
    }
    
    func setupConstraints() {
        views["scrollView"] = scrollView
        views["wrapperView"] = wrapperView
        
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: [], metrics: nil, views: views)
        constraints +=  NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: [], metrics: nil, views: views)
        
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[wrapperView]|", options: [], metrics: nil, views: views)
        constraints +=  NSLayoutConstraint.constraintsWithVisualFormat("V:|[wrapperView]|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
                if (emailInput.text == "" || passwordInput.text=="") {
                    let alert = UIAlertController(title: "빠짐없이 입력해주세요!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
                    alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.Cancel, handler: nil))
        
                    self.presentViewController(alert, animated:true, completion:nil)
                    return;
                } else {
                    
                    Alamofire.request(UserRouter.LoginUser(["email": String(emailInput.text!), "password": String(passwordInput.text!)]))
                        .responseJSON { response in
                            if let jsonResult = response.result.value {
                                
                                if let temp:String = jsonResult["status"] as? String{
                                print(temp)
                                    if temp != "0" {
                                        print(temp)
                                        let alert = UIAlertController(title: "로그인 실패!", message: "",preferredStyle: UIAlertControllerStyle.Alert)
                                    }
                                } else{
//                                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                    let vc:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("boardListViewController") as! UINavigationController
//                                    self.presentViewController(vc, animated: true, completion: nil)
                                }
                                }


                                    //TODO: 이거 status 비교해서 0아니면 jsonResult.value.message 출력해야함
//                                if String(jsonResult["status"]!) != "0" {
//                                    let alert = UIAlertController(title: "로그인 실패!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
//                                } else {
                                    User.userId = "ddd";
                                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    let vc:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("boardListViewController") as! UINavigationController
                                    self.presentViewController(vc, animated: true, completion: nil)
//                                }
                          

                            }
                    }
                    
                    
                    
        }
    }



