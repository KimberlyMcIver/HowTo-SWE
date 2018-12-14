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

class MentorMenteeViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var userCollection: UICollectionView!
    
    var images = [UIImage]()
    var usersList = [UserModel]()
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImages()
        
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
        //showChatControllerForUser()
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
        
        //let chatLogController = ChatLogViewController(collectionViewLayout: UICollectionViewFlowLayout())
        //navigationController?.pushViewController(chatLogController, animated: true)
        
        //self.performSegue(withIdentifier: "goBackToSignInFromSignOut", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = userCollection.dequeueReusableCell(withReuseIdentifier: "MiniCell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        
        cell.imageView.image = image
        
        let user: UserModel
        user = usersList[indexPath.row]
        cell.nameLabel.text = user.firstName
        cell.occupationLabel.text = user.schoolOccupation
        cell.skillsLabel.text = user.skills
        cell.desiredSkillsLabel.text = user.desiredSkills
        cell.locationLabel.text = user.location
        cell.mentorMenteeLabel.text = user.mentorOrMentee
        
        return cell
    }
    
   // var messagesController: MessagesController?
    
//    func collectionView(_ collectionView: UICollectionView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        dismiss(animated: true){
//            print("Dismiss completed")
//        }
//      //  let user = self.users[indexPath.row]
//       // self.messag
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        print("Did Select")
    }

}
