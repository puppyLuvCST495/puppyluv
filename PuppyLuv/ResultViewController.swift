//
//  ResultViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/19/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit
import Parse


class ResultViewController: UIViewController {

    var allAnswers = [String]()
    var age = ["Yes": ["10-12 years","12-15 years","15-17 years","15+ years","13-15 years","11-13 years","14 years", "12-14 years","12-13 years","11-15 years","12-14 years","14-16 years","12 years","15 years","9-15 years"],
               "No":["6-8 years","7-10 years","9 years","8-11 years"]]
  
    var shedding = ["Yes":["Regularly","Occasional","Weekly Brushing","Frequent","Occasional Bath/Brush"],
                    "No": ["Infrequent","Seasonal"]]
       
  //  query .whereKey("playerName", containedIn: names)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(allAnswers)

        // Do any additional setup after loading the view.
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
                                     // Do something with the found objects
                                     for object in objects {
                                
                                     print(object)
                                     print("Successfully retrieved \(objects.count) breeds.")
                                      
                                     }
                                 }
                             }
                   }
       

    
}
