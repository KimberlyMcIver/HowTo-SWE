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
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSignIn", sender: self)
    }

}
