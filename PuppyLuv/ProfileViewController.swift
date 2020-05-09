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


class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var matches = [PFObject]()
//    var matches: [[String:Any]]!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRound()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateTableView()
        
        let currentUser = PFUser.current()!.username
        print(currentUser as Any)
        let user = PFUser.current()!

        let query = PFQuery(className: "User")
        query.whereKey("username", equalTo: currentUser as Any)
        query.includeKeys(["username","image", "display_name", "description"])

        query.findObjectsInBackground { (users, error) in
            if error == nil {
                print("Successfully retrieved.")
            } else {
                print("Error:")
                print(error as Any)
            }
        }
        
        
        if let imageFile = user["image"] as? PFFileObject {
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            profileImageView.af_setImage(withURL: url)
            displayNameLabel.text = user["display_name"] as? String
            descriptionLabel.text = user["description"] as? String
        } else {
            profileImageView.image = UIImage(named:"PuppyLuv-Logo")
            displayNameLabel.text = user["display_name"] as? String
            descriptionLabel.text = user["description"] as? String
        }
                        
        
    }
    
    
    
    func makeRound(){
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
    }
    
    
    @objc func updateTableView(){
        let query = PFQuery(className: "UserResults")
        query.whereKey("user", equalTo: PFUser.current())
            query.includeKeys(["user", "results", "picture"])
            query.limit = 10
            
            query.findObjectsInBackground { (matches, error) in
                if matches != nil {
                    self.matches = matches!
                    self.tableView.reloadData()
                }
                
            }
            self.tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileMatchCell") as! ProfileMatchCell
        
        let match = matches[indexPath.row]
        
        let imageFile = match["picture"] as! String
        let url = URL(string: imageFile)!
        
        cell.matchBreedLabel.text! = match["results"] as! String
        cell.matchImage.af_setImage(withURL: url)
    
        print(match["results"] as! String)

        return cell
    }
    
    
    @IBAction func settingTapped(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: self)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "setting"){
////                performSegue(withIdentifier: "setting", sender: self)
//
//        }
        if(segue.identifier == "details"){
            print("loading up detail screen")
            // Find the selected movie
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            
            let dogMatch = matches[indexPath!.row]
            
            // pass the selected movie to the details view
            let detailsViewController: ProfileDetailViewController = segue.destination as! ProfileDetailViewController
            detailsViewController.match = dogMatch
        }
            
         
       
        

    
        
    }
    
    
    
}
