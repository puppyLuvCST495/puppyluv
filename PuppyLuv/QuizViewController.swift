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

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var StartQuizButton: UIButton!
    // Variables
    var currentQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        StartQuizButton.layer.cornerRadius = 10
        titleView.layer.cornerRadius = 10
        
    }
       //  var breed = []
/*
    }
          override func viewDidAppear(_ animated: Bool) {
                    super.viewDidAppear(animated)
                        let query = PFQuery(className:"Breeds")
                               query.whereKey("Weight", greaterThanOrEqualTo: "15")
                              // query.whereKey("Lifespane", contains: "12")
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
                                print("Successfully retrieved \(objects.count) breeds.")
                              }
                          }
                }
    

 
    

 }

*/

}
