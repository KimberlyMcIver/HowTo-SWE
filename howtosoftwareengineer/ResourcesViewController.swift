//
//  ResourcesViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/24/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDataSource {

 
    @IBOutlet weak var tableViewResources: UITableView!
    
    var resources: [[String: Any]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableViewResources.dataSource = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(signOutButtonTapped))
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=hacker-news&apiKey=d65fb8f01d8e42c7b106590d09149d39")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionaryResources = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                guard let resources = dataDictionaryResources["articles"] as? [[String: Any]] else {return}
                self.resources = resources
                self.tableViewResources.reloadData()
            }
            
        }
        task.resume()
        
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton){
        // self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        print("sign out sucessful")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewResources.dequeueReusableCell(withIdentifier: "ResourceCell", for: indexPath) as! ResourceCell
        
        
        let resource = resources[indexPath.row]
        let title = resource["title"] as! String
        let description = resource["description"] as? String
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        
        
        return cell
    }

}
