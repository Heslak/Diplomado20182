//
//  ViewController.swift
//  BunsanMessenger
//
//  Created by Misael Pérez Chamorro on 6/1/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let messagesStore = MessagesStore.sharedInstance
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var bottomSpace : NSLayoutConstraint!
    @IBOutlet weak var sendMessageTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesStore.fetchMessagesFromJson()
        setupTableViewCell()
        setupKeyboardNotifications()
        setupScrollNotifications()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    func setupTableViewCell(){
        self.tableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageTableViewCell")
        self.tableView.estimatedRowHeight = 80
    }
    
    func setupKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func handleKeyboardNotification(notification: NSNotification){
        guard let userInfo = notification.userInfo else { return }
        let keyBoardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        
        
        if notification.name == NSNotification.Name.UIKeyboardWillShow{
            bottomSpace.constant = -(keyBoardFrame?.height)! + 30
        }else{
            bottomSpace.constant = 0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupScrollNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleScrollNotification), name: NSNotification.Name(rawValue: "com.numsan.didScroll"), object: nil)
    }
    
    @objc func handleScrollNotification(notification: NSNotification){
        sendMessageTextField.resignFirstResponder()
    }
    
    @IBAction func sendMessageButtinWasTouchedUpInside(){
        sendMessageTextField.resignFirstResponder()
    }


}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesStore.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as? MessageTableViewCell
        let message = messagesStore.messages[indexPath.row]
        cell?.bindWithMessage(message: message)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //NotificationCenter.default.post(name: Notification.Name(rawValue: "com.numsan.didScroll"),object: self)
        sendMessageTextField.resignFirstResponder()
    }
}
