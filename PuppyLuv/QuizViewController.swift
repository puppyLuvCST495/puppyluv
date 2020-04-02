//
//  QuizViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/1/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    // Label
    @IBOutlet weak var questionLabel: UILabel!
    
    
    // Questions and answer options
    let questions = ["What is your experience with dogs?",
                     "How much time can you put into training your dog?",
                     "What is your home like?",
                     "Do you prefer only to see dogs that are suitable for apartments?",
                     "Do you have kida under age 10?",
                     "What is your noise tolerance for barking?",
                     "What is your tolerance for shedding?",
                     "What is your activity level?"
    ]
    let answers = [
        ["New to dogs", "Currently own a dog", "Owned a dog in the past"],
        ["1-5 Hourd a week", "5-10 hours a week"],
        ["An apartment", "A house with a small yard", "A house with a large yard"],
        ["Yes", "No"],
        ["Yes", "No"],
        ["Only when necessary", "Likes to be vocal"],
        ["Infrequent", "Frequent"],
        ["Hanging on the couch", "Wlaking around the neighborhood", "Going on an adventure"],
        
    ]
    
    // Variables
    var currentQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
