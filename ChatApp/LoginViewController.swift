//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Gülsüm Demirbaş on 23.04.2024.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {

    
    //MARK - PROPERTİES
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    
    //MARK - FUNCTİONS
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func showAlert(_ msg : String){
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alerAction)
        DispatchQueue.main.sync {
            self.present(alertController, animated: true)
        }
    }
    
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) { user, error in
        if(error != nil){
            debugPrint(error!)
            self.showAlert(error?.localizedDescription ?? "")
            
        }else{
            let vc = self.storyboard?.instantiateViewController(identifier: "ChatStoryboardId") as! ChatViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    }
    
    
    /*Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) { user, error in
    if(error != nil){
        debugPrint(error)
        self.showAlert(error?.localizedDescription ?? "")
        
    }else{
        let vc = self.storyboard?.instantiateViewController(identifier: "ChatStoryboardId") as! ChatViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
     */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
