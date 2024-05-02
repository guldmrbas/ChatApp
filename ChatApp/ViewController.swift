//
//  ViewController.swift
//  ChatApp
//
//  Created by Gülsüm Demirbaş on 23.04.2024.
//

import UIKit
import FirebaseCore

class ViewController: UIViewController {

    
    //MARK: -PROPERTİES
    let stoaryboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    // MARK = -FUNCTİONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    
    @IBAction func btnClickedLogIn(_ sender: UIButton) {
        let vc  = stoaryboard.instantiateViewController(withIdentifier: "LoginStoryboardId") as! LoginViewController
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func btnClickedRegister(_ sender: UIButton) {
        let vc = stoaryboard.instantiateViewController(withIdentifier: "RegisterStoryboardId") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

