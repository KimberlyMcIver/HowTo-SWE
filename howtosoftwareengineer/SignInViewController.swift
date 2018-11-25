//
//  SignInViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 10/25/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
   var dataObject: String = ""

    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var continueAsGuestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        
        // TODO: form validation on email and password
        if let email = emailTextField.text, let pass = passwordTextField.text {
            
        // Sign in the user with Firebase
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    
            // Check that user isn't nil
            if let u = user {
                // user is found, go to main screen
                self.performSegue(withIdentifier: "goToSwipe", sender: self)
            } else {
                    // Error: check error and show message
            }
        }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //  Dismiss the keyboard when the view is tapped on
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    @IBAction func continueAsGuestButtonTapped(_ sender: UIButton) {
      //  self.performSegue(withIdentifier: "goToMainScreen", sender: self)
        self.performSegue(withIdentifier: "goToSwipe", sender: self)
    }
    
}

