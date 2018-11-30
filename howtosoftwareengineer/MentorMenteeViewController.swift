//
//  MentorMenteeViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/30/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit
import Firebase

class MentorMenteeViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var userCollection: UICollectionView!
    
    var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImages()
    
    }
    
    func loadImages() {
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        self.userCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = userCollection.dequeueReusableCell(withReuseIdentifier: "MiniCell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        
        cell.imageView.image = image
        return cell
        
    }

}
