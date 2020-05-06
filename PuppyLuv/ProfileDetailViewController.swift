//
//  ProfileDetailViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 5/6/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse

class ProfileDetailViewController: UIViewController {
    
    var match: PFObject?
    
    
    @IBOutlet weak var breedImage: UIImageView!
    @IBOutlet weak var lifeSpanView: UIView!
    @IBOutlet weak var groomingView: UIView!
    @IBOutlet weak var sheddingView: UIView!
    @IBOutlet weak var energyView: UIView!
    @IBOutlet weak var weightView: UIView!
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lifelabel: UILabel!
    @IBOutlet weak var groominglabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var sheddinglabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    
    
    var breedName:String = ""
    var matches = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(match as Any)
        breedName = match!["results"] as! String
        
        lifeSpanView.layer.cornerRadius=10
        groomingView.layer.cornerRadius=10
        sheddingView.layer.cornerRadius=10
        energyView.layer.cornerRadius=10
        weightView.layer.cornerRadius=10
        
        
        breedNameLabel.text = breedName
        let imageUrl = match!["picture"] as! String
        let url = URL(string: imageUrl)!
        breedImage.af_setImage(withURL: url)
         
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           self.fillIn()
       
       }
    
    func fillIn(){
        let query = PFQuery(className: "Breeds")
        query.whereKey("Breed", equalTo: breedName)
        query.includeKeys(["Lifespane", "Grooming", "Energy", "Shedding", "Weight", "Description", "Group"])
        
        query.findObjectsInBackground { (dogs, error) in
            if dogs != nil {
                self.matches = dogs!
                print(dogs!)
                
            }
            
        }
//        groupLabel.text = dogs[match["Group"]]
        
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
