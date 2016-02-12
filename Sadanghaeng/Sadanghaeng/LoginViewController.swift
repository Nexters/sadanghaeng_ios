
import UIKit
import UnderKeyboard

class LoginViewController: UIViewController {
  @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
  let underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
  let keyboardObserver = UnderKeyboardObserver()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    underKeyboardLayoutConstraint.setup(bottomLayoutConstraint, view: view,
      bottomLayoutGuide: bottomLayoutGuide)
    keyboardObserver.start()
    
    // Called before the keyboard is animated
    keyboardObserver.willAnimateKeyboard = { height in
        myConstraint.constant = height
    }
    
    // Called inside the UIView.animateWithDuration animations block
    keyboardObserver.animateKeyboard = { height in
        myView.layoutIfNeeded()
    }
  }
  
//  @IBAction func didTapCloseKeyboard(sender: AnyObject) {
//    view.endEditing(false)
//  }
  
  @IBAction func didTapLoginButton(sender: AnyObject) {
    view.endEditing(false)
  }
}