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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //makeRound()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        
//        let user = PFObject(className: "User")
        let user = PFUser.current()
//        let query = PFQuery(className: "User")
////        query.includeKeys(["username", "profile_img"])
//        let imageFile = user!["profile_img"] as! PFFileObject
//        let urlString = imageFile.url!
//        let url = URL(string: urlString)!
//        print(user!["profile_img"])
//        print(imageFile)
//        print(urlString)
//        print(url)
//
//        profileImageView.af_setImage(withURL: url)
        displayNameLabel.text = PFUser.current()?["username"] as? String
        descriptionLabel.text = PFUser.current()?["profile_description"] as? String
//        print(PFUser.current()?["profile_description"])
    }
    
    
    
//    func makeRound(){
//        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
//        profileImage?.clipsToBounds = true
//        profileImage?.layer.borderWidth = 3.0
//        profileImage?.layer.borderColor = UIColor.white.cgColor
//    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
