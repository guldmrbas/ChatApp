//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Gülsüm Demirbaş on 23.04.2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class ChatViewController: UIViewController {
   
    
   
    
   
    

    @IBOutlet weak var messageTableView: UITableView!
    
    @IBOutlet weak var messageTF: UITextField!
    
    
    @IBOutlet weak var sendBtn: UIButton!
    
    var msgArr: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()

    }
    private func initViews(){
        self.navigationController?.navigationBar.isHidden = true
        let nib = UINib(nibName: "ChatCell", bundle: nil)
        messageTableView.register(nib, forCellReuseIdentifier: "ChatReuseIdentifier")
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        getMessages()
    }
    

  
    @IBAction func logoutClickedBtn(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
            
        }catch{
            debugPrint(error)
        }
    }
    
    @IBAction func clickedBtnSnd(_ sender: UIButton) {
        messageTF.endEditing(true)
        messageTF.isEnabled = false
        sendBtn.isEnabled = false
        
        
        let msgDB = Database.database().reference().child("Message")
        let msgDict = [ "Sender" : Auth.auth().currentUser?.email, "MessageBody" : messageTF.text!]
        msgDB.childByAutoId().setValue(msgDict, andPriority: .none){
            error , ref in
            if(error != nil){
                debugPrint(error?.localizedDescription)
            }else{
                debugPrint("Message saved successfully")
                self.messageTF.text = ""
                self.messageTF.isEnabled = true
                self.sendBtn.isEnabled = true
            }
        }
    
    }
    
    private func getMessages(){
        let msgDB = Database.database().reference().child("Message")
        msgDB.observe(.childAdded){
            snapShot in
            let value = snapShot.value as! Dictionary< String , String>
            let text = value["MessageBody"]!
            let sender = value["Sender"]!
            let msg = Message()
            msg.messageBody = text
            msg.sender = sender
            self.msgArr.append(msg)
            debugPrint(self.msgArr.count)
            self.messageTableView.reloadData()
        }
    }
    
    
}

extension ChatViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
}

extension ChatViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return msgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatReuseIdentifier") as! ChatTableViewCell
        cell.messageLbl.text = msgArr[indexPath.row].messageBody
        cell.usernameLbl.text = msgArr[indexPath.row].sender
        return cell
    }
    
   
}
