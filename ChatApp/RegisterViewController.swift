//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Gülsüm Demirbaş on 23.04.2024.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class RegisterViewController: UIViewController {

    // MARK - PROPERTİES
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sifreTextField: UITextField!
    
    
    
    //MARK-FUNCTİONS
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
   
    
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { user, error in
            if(error == nil){
                debugPrint("registration successfull")
                let vc = self.storyboard?.instantiateViewController(identifier: "ChatStoryboardId") as! ChatViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                debugPrint(error)
            }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
