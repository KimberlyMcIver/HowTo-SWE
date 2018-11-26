//
//  ForgotPasswordViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/13/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "test", style: .done, target: self, action: )
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOutButtonTapped))

         forgotPasswordLabel.numberOfLines = 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton){
       // self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        print("we made it")
    }
    
}
