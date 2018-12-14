//
//  ListController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 12/13/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit
import Firebase

class ListController: UITableViewController {
    
    let cellId = "cellId"
    
    var users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        fetchUser()
        
       // observeMessages()
    }
    
    func observeMessages() {
        let ref = Database.database().reference().child("messages")
        ref.observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let message = Message(dictionary: dictionary)
                message.setValuesForKeys(dictionary)
                print(message.text)
                
            }
            
          //  print(snapshot)
            
        }, withCancel: nil)
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                let userFirstName = dictionary["firstName"]
                let userLastName = dictionary["lastName"]
                let userOccupation = dictionary["schoolOccupation"]
                let userSkills = dictionary["skills"]
                let userDesiredSkills = dictionary["desiredSkills"]
                let userLocation = dictionary["location"]
                let userMentorOrMentee = dictionary["mentorOrMentee"]
                
                let user = UserModel(firstName: userFirstName as! String?, lastName: userLastName as! String?, schoolOccupation: userOccupation as! String?, location: userLocation as! String?, skills: userSkills as! String?, desiredSkills: userDesiredSkills as! String?, mentorOrMentee: userMentorOrMentee as! String?)
                user.id = snapshot.key
                
                self.users.append(user)
                
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
                print(user.firstName)
            }
        }, withCancel: nil)
    }
    
    func showChatControllerForUser(user: UserModel) {
        let chatLogController = ChatLogViewController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user
        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.firstName
        cell.detailTextLabel?.text = user.schoolOccupation
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = self.users[indexPath.row]
        showChatControllerForUser(user: user)
    }
}

class UserCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.lightGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
