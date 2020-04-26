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
    
    @IBOutlet weak var titleView: UIView!
    // Label
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    // Variables
    var currentQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.layer.cornerRadius=15
        submitButton.layer.cornerRadius=15
        
}
}
