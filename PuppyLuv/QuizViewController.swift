//
//  QuizViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/1/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse

class QuizViewController: UIViewController {
    
    // Label
    @IBOutlet weak var questionLabel: UILabel!
    

    
    
    
    // Variables
    var currentQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //  var breed = []
        
          let query = PFQuery(className:"Breeds")
          query.whereKey("Weight", contains: "under")
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
                    
                   }
               }
           }
    
}
 
    

 }

