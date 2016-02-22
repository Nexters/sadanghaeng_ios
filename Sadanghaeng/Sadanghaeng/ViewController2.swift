
import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleText = "제목이 들어갑니다"
        let nameText = "가린ㅇㅇㅇ"
        let contentText = "다가서지 못하고 헤매이고 있어\n좋아하지만 다른 곳을 보고 있어\n가까워지려고 하면 할수록\n멀어져 가는 우리 둘의 마음처럼\n만나지 못해 맴돌고 있어\n우린 마치 평행선처럼\n말도 안 돼 우린 반드시 만날 거야\n기다릴게 언제까지나"
        
        self.titleLabel.text = titleText
        self.contentLabel.text = contentText
        self.nameLabel.text = nameText

        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:
            UIKeyboardWillHideNotification, object: nil)
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
    
    //
    
    @IBAction func ActionSheetButtonTapped(sender: AnyObject) {
        var myActionSheet = UIAlertController(title: "이 게시물에 대한 기능", message: "뭐 할까요?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let edit = UIAlertAction(title: "수정", style: .Default) { (Alert:UIAlertAction) -> Void in
            print("edit tapped")
        }
        let delete = UIAlertAction(title: "삭제", style: .Default) { (Alert:UIAlertAction) -> Void in
            print("delte tapped")
        }
        let report = UIAlertAction(title: "신고", style: .Default) { (Alert:UIAlertAction) -> Void in
            print("report tapped")
        }
        let close = UIAlertAction(title: "취소", style: .Cancel) { (Alert:UIAlertAction) -> Void in
            print("close tapped")
        }
        
        myActionSheet.addAction(edit)
        myActionSheet.addAction(delete)
        myActionSheet.addAction(report)
        myActionSheet.addAction(close)
        
        self.presentViewController(myActionSheet, animated: true, completion: nil)
    }
    
}
