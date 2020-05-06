//
//  QuestionTwoViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/19/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit

class QuestionTwoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var question2: UITextView!
    
    @IBOutlet weak var picker2: UIPickerView!
    
    var recievedAnswer = [String]()
    
    let answers1 = ["Yes","No"]
    
    var str1 = [String]()
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers1[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        str1 = recievedAnswer
        
        
        return str1.append(answers1[row] )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        var threeVC: QuestionThreeViewController = segue.destination as! QuestionThreeViewController
        
        if str1==[]{
            str1 = recievedAnswer
            str1.append("Yes")
            threeVC.recievedAnswer2 = str1
        }else{
            threeVC.recievedAnswer2 = str1
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picker2.delegate = self
        picker2.dataSource = self
        
        print(recievedAnswer)
    }
    
}
