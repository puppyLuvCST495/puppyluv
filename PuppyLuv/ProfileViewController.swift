//
//  ProfileViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 3/16/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var likeButton: UITabBarItem!
    @IBOutlet weak var dislikeButton: UITabBarItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRound()
        // Do any additional setup after loading the view.
    }
    
    func makeRound(){
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
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
