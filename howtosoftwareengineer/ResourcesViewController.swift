//
//  ResourcesViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/24/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOutButtonTapped))
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton){
        // self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        print("we made it")
    }
    

}
