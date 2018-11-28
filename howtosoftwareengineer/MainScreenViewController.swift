//
//  MainScreenViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/27/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var articles: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        let url = URL(string: "https://newsapi.org/v2/everything?sources=techcrunch&apiKey=d65fb8f01d8e42c7b106590d09149d39")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            
             //This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let articles = dataDictionary["results"] as! [[String: Any]]
                self.articles = articles
                self.tableView.reloadData()
                }
            }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        let article = articles[indexPath.row]
        let title = article["title"] as! String
        let description = article["description"] as! String
        
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        
        return cell
    }



}
