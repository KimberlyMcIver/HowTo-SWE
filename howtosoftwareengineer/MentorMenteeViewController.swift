//
//  MentorMenteeViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/30/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MentorMenteeViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var userCollection: UICollectionView!
    
    var images = [UIImage]()
    var usersList = [UserModel]()
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredUserList = [UserModel]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImages()
        searchBar?.placeholder = "Search Users"
        
        ref = Database.database().reference().child("users")
        ref?.observe(.value, with: { (snapshot) in   // change to user added
            if snapshot.childrenCount > 0 {
                for users in snapshot.children.allObjects as![DataSnapshot] {
                    let userObject = users.value as? [String: AnyObject]
                    let userFirstName = userObject?["firstName"]
                    let userLastName = userObject?["lastName"]
                    let userOccupation = userObject?["schoolOccupation"]
                    let userSkills = userObject?["skills"]
                    let userDesiredSkills = userObject?["desiredSkills"]
                    let userLocation = userObject?["location"]
                    let userMentorOrMentee = userObject?["mentorOrMentee"]
                    
                    let user = UserModel(firstName: userFirstName as! String?, lastName: userLastName as! String?, schoolOccupation: userOccupation as! String?, location: userLocation as! String?, skills: userSkills as! String?, desiredSkills: userDesiredSkills as! String?, mentorOrMentee: userMentorOrMentee as! String?)
                    
                    self.usersList.append(user)
                }
                self.userCollection.reloadData()
            }
        })
    }
    
    @IBAction func messageButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showList", sender: self)
    }
    
    func loadImages() {
        images.append(UIImage(named: "woman")!)
        images.append(UIImage(named: "woman4")!)
        images.append(UIImage(named: "Carlosheadshot")!)
        images.append(UIImage(named: "man")!)
        images.append(UIImage(named: "man4")!)
        images.append(UIImage(named: "man1")!)
        images.append(UIImage(named: "woman1")!)
        images.append(UIImage(named: "man3")!)
        images.append(UIImage(named: "kim10")!)
        self.userCollection.reloadData()
    }
    
    func showChatControllerForUser() {
        let vc = ChatLogViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.present(vc, animated: false, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return filteredUserList.count
        } else {
            return usersList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = userCollection.dequeueReusableCell(withReuseIdentifier: "MiniCell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image
        
        if searching {
            let user: UserModel
            user = filteredUserList[indexPath.row]

            cell.nameLabel.text = user.firstName
            cell.occupationLabel.text = user.schoolOccupation
            cell.skillsLabel.text = user.skills
            cell.desiredSkillsLabel.text = user.desiredSkills
            cell.locationLabel.text = user.location
            cell.mentorMenteeLabel.text = user.mentorOrMentee
            
        } else {
            let user: UserModel
            user = usersList[indexPath.row]
            cell.nameLabel.text = user.firstName
            cell.occupationLabel.text = user.schoolOccupation
            cell.skillsLabel.text = user.skills
            cell.desiredSkillsLabel.text = user.desiredSkills
            cell.locationLabel.text = user.location
            cell.mentorMenteeLabel.text = user.mentorOrMentee
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        print("Did Select")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUserList = usersList.filter({ (user : UserModel) -> Bool in
            searching = true
            return user.skills!.lowercased().contains(searchText.lowercased())
        })
        userCollection.reloadData()
        
        if (searchBar.text?.isEmpty)! {
            searching = false
        }
    }
}


