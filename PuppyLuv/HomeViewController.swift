//
//  HomeViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 3/16/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

  
    @IBOutlet weak var intoView: UIView!
    @IBOutlet weak var quizView: UIView!
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var toProfileButton: UIButton!
    @IBOutlet weak var toQuizButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intoView.layer.cornerRadius = 15
        intoView.layer.masksToBounds = true
        
        quizView.layer.cornerRadius = 15
        quizView.layer.masksToBounds = true
        
        profileView.layer.cornerRadius = 15
        profileView.layer.masksToBounds = true
        
        toProfileButton.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToQuizButton(_ sender: Any) {
        performSegue(withIdentifier: "toQuizView", sender: self)
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
