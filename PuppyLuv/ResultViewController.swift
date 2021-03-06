//
//  ResultViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/19/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit
import Parse
import Alamofire
import AlamofireImage


class ResultViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var object = [PFObject]()
    
    var allAnswers = [String]()
    var age = ["Yes": ["12-14 years","10-12 years","12-15 years","15+ years","10-15 years","14-15 years","10-13 years","11-13 years","12-13 years","9-14 years","10-14 years","9-11 years","13-15 years","11-16 years","14-16 years","11-14 years","14 years","12+ years","9-12 years","16 years","15 years","9-15 years","12 years","14-17 years","14-17 years","15-17 years","8-12","13-18"],
               "No":["8-10 years","7-10 years","7-9 years","8-11 years","9 years","6-8 years","5-8 years"]]
    
    var shedding = ["Yes":["Regularly","Occasional","Weekly Brushing","Frequent","Occasional Bath/Brush"],
                    "No": ["Infrequent","Seasonal"]]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.reloadData()
        print(allAnswers)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Breeds")
        // query.whereKey("Weight", greaterThanOrEqualTo:"15")
        query.whereKey("Training", contains: allAnswers[0])
        query.whereKey("Lifespane", containedIn: age[allAnswers[1]]!)
        query.whereKey("Engery", contains: allAnswers[2])
        query.whereKey("Shedding", containedIn: shedding[allAnswers[3]]!)
        //query.whereKey("Energy", containedIn: energy[allAnswers[2]])
        
        
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) breeds.")
     
                self.object = objects
                self.tableView.reloadData()
                
            }
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell") as! ResultsCell
        
        let o = object[indexPath.row]
        let imageUrl = o["Picture"] as! String
        let url = URL(string: imageUrl)!

        
        cell.ResultImage.af_setImage(withURL: url)
        cell.info.text = o["Description"] as! String
        cell.group.text = o["Group"] as! String
        cell.breed.text = o["Breed"] as! String
        cell.infoTemperamentLabel.text = o["Temperament"] as? String

        
        let userResults = PFObject(className: "UserResults")
        userResults["user"] = PFUser.current()
        userResults["results"] = o["Breed"]
        userResults["picture"] = imageUrl
        
        userResults.saveInBackground { (success, error) in
            if success {
                print("saved")
                self.dismiss(animated: true, completion: nil)
            }else {
                print("error in saving")
            }
            
        }

        return cell
        
        
    }
    
    
}


