//
//  QuestionFourViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/19/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit
import Parse

class QuestionFourViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var question4: UITextView!
    
    @IBOutlet weak var picker4: UIPickerView!
    
    var recievedAnswer3 = [String]()
    
    let answers4 = ["Select One","Yes","No"]
    var str4 = [String]()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers4[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers4.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        str4 = recievedAnswer3
        return str4.append(answers4[row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var results: ResultViewController = segue.destination as! ResultViewController
        
        
        results.allAnswers = str4
        
        let userResults = PFUser.current()!
        let deleteQuery = PFQuery(className:"UserResults")
        deleteQuery.whereKey("user", equalTo: userResults)
        deleteQuery.findObjectsInBackground {
            (objects, error) -> Void in
            if error == nil {
                for object in objects! {
                    print("removed user")
                    object.deleteEventually();
                }
            }
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker4.delegate = self
        picker4.dataSource = self
        
        submitButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
        print(recievedAnswer3)
    }
    
    
}
