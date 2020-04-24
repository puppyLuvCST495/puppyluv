//
//  ProfileViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 3/16/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit
import AlamofireImage
import Parse
class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var users = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRound()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let currentUser = PFUser.current()!.username
        print(currentUser as Any)
        let user = PFUser.current()!
//
        let query = PFQuery(className: "User")
        query.whereKey("username", equalTo: currentUser as Any)
//        query.whereKey("author", equalTo: user as Any)
        query.includeKeys(["username","image", "display_name", "description"])
//
        query.findObjectsInBackground { (users, error) in
            if error == nil {
                print("Successfully retrieved.")
//                print(users as Any)
            } else {
                print("Error:")
                print(error as Any)
            }
        }

        let imageFile = user["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        

//        print(imageFile)
//        print(urlString)
        print(url)

        profileImageView.af_setImage(withURL: url)
        displayNameLabel.text = user["display_name"] as? String
        descriptionLabel.text = user["description"] as? String
    }
    
    
    
    func makeRound(){
        profileImageView?.layer.cornerRadius = (profileImageView?.frame.size.width ?? 0.0) / 2
        profileImageView?.clipsToBounds = true
        profileImageView?.layer.borderWidth = 3.0
        profileImageView?.layer.borderColor = UIColor.white.cgColor
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
