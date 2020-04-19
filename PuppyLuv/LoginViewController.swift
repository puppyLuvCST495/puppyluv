//
//  LoginViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 3/16/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse

@available(iOS 13.0, *)
class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signupTapped(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
       
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user,error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            }else {
                 
                let invalid_alert = UIAlertController(title: "Try Again", message: "Invalid Username/Password", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                invalid_alert.addAction(action)
                self.present(invalid_alert, animated: true, completion: nil);
                print("Error: \(error?.localizedDescription)")
            }
        }

        
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
