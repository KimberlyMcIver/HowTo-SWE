//
//  RegistrationViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/24/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height+100)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+100)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u = user {
                    self.performSegue(withIdentifier: "goToSwipeVC", sender: self)
                } else {
                    // Error: check error and show message
                }
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
