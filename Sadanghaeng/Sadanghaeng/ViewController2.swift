
import UIKit

class ViewController2: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var commentTableView: UITableView!
    
    var isSelected:Bool = false
    
    let comments:[String] = ["언젠가는 못다한 말을 전할거야","시간을 달려서 어른이 될 수만 있다면","머냥","밀크티 맛있당ㅎㅎㅎㅎ","하나 더 쓸꺼야","1등 할꼬야","갸악","ㅜㅜㅜㅜ\n왜 안돼"]
    let numberOfRow: Int = 8
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleText = "시간을 달려서~~~~😳"
        let nameText = "가린이개가을이"
        let contentText = "다가서지 못하고 헤매이고 있어\n좋아하지만 다른 곳을 보고 있어\n가까워지려고 하면 할수록\n멀어져 가는 우리 둘의 마음처럼\n만나지 못해 맴돌고 있어\n우린 마치 평행선처럼\n말도 안 돼 우린 반드시 만날 거야\n기다릴게 언제까지나"
        
        self.titleLabel.text = titleText
        self.contentLabel.text = contentText
        self.nameLabel.text = nameText
        
        // 테이블 row가 아닌건 안보이게
        let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10))
        tableViewFooter.backgroundColor = UIColor.clearColor()
        self.commentTableView.tableFooterView = tableViewFooter
        self.tableHeightConstraint.constant = CGFloat(numberOfRow) * 60
        //self.view.layoutIfNeeded()

        //키보드 조정
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:
            UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        commentTableView.reloadData()
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    // 키보드 조정
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
    // 네비게이션 색 변경
    override func viewWillAppear(animated: Bool) {
        // custom navigation bar
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 253/255, green: 64/255, blue: 55/255, alpha: 1)
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
    
    // 액션시트
    
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
//////////////////////////////////////////
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "commentCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CommentTableViewCell
        
        cell.comment.text = comments[indexPath.row]
        cell.commentLikeButton.tag = indexPath.row
        cell.commentLikeButton.addTarget(self, action: "likeAction", forControlEvents: .TouchUpInside)
        return cell
    }
    @IBAction func likeAction(sender: UIButton) {
        let titleString = self.comments[sender.tag] as? String
        
        let firstActivityItem = "\(titleString!)"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    //버튼 액션 - 글 좋아요
    @IBAction func likeButtonTapped(sender: UIButton) {
        
        if isSelected == false {
            sender.setImage(UIImage(named: "like_pressed.png"), forState: UIControlState.Normal)
            dislikeButton.setImage(UIImage(named: "dislike_normal.png"), forState: UIControlState.Normal)
            isSelected = true
        } else {
            sender.setImage(UIImage(named: "like_normal.png"), forState: UIControlState.Normal)
            //dislikeButton.setImage(UIImage(named: "dislike_pressed.png"), forState: UIControlState.Normal)
            isSelected = false
        }
        
        
    }
    
    @IBAction func dislikeButtonTapped(sender: UIButton) {
        if isSelected == false {
            sender.setImage(UIImage(named: "dislike_pressed.png"), forState: UIControlState.Normal)
            likeButton.setImage(UIImage(named: "like_normal.png"), forState: UIControlState.Normal)
            isSelected = true
        } else {
            sender.setImage(UIImage(named: "dislike_normal.png"), forState: UIControlState.Normal)
            isSelected = false
        }
    }
    
    
    
    
}
