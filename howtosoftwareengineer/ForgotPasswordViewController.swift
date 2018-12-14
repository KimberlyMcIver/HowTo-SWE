//
//  ForgotPasswordViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/13/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var emailTextFieldForgotPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "test", style: .done, target: self, action: )
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOutButtonTapped))

         forgotPasswordLabel.numberOfLines = 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton){
    
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error siging out: %@", signOutError)
        }
        
       self.performSegue(withIdentifier: "goBackToSignInFromSignOut", sender: self)
        print("sign out sucessful")
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
       // let email = emailTextField2.text

        //        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
//            <#code#>
//        }
        
        print("reset tapped")
    }
    
    
}
