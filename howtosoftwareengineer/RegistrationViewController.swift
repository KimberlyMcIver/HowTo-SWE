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
import FirebaseDatabase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolOccupationTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var skillsTextField: UITextField!
    @IBOutlet weak var desiredSkillsTextField: UITextField!
    @IBOutlet weak var mentorMenteeTextField: UITextField!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("users")
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+100)
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            
            //let userID =
            
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u = user {
                    //self.ref?.child("users").childByAutoId().setValue("Hello Firebase")
                    let userID = Auth.auth().currentUser?.uid
                    self.ref?.child(userID!).child("firstName").setValue(self.firstNameTextField.text)
                    self.ref?.child(userID!).child("lastName").setValue(self.lastNameTextField.text)
                    self.ref?.child(userID!).child("schoolOccupation").setValue(self.schoolOccupationTextField.text)
                    self.ref?.child(userID!).child("location").setValue(self.locationTextField.text)
                    self.ref?.child(userID!).child("skills").setValue(self.skillsTextField.text)
                    self.ref?.child(userID!).child("desiredSkills").setValue(self.desiredSkillsTextField.text)
                    self.ref?.child(userID!).child("mentorOrMentee").setValue(self.mentorMenteeTextField.text)
                    
                    self.performSegue(withIdentifier: "goToSwipeVC", sender: self)
                    
                } else {
                    // Error: check error and show message
                    let alert = UIAlertController(title: "Unable to create account", message: "Check that all information provided is correct, and try again", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
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
