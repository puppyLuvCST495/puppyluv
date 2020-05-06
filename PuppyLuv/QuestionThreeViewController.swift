//
//  QuestionThreeViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/19/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit

class QuestionThreeViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var question3: UITextView!
    
    @IBOutlet weak var picker3: UIPickerView!
    var recievedAnswer2 = [String]()
    
    let answers3 = ["Regular Exercise","Energetic","Needs lots of Activity","Calm","Regular"]
    var str3 = [String]()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers3[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers3.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        str3 = recievedAnswer2
        return str3.append(answers3[row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var fourVC: QuestionFourViewController = segue.destination as! QuestionFourViewController
        
        if str3==[]{
            str3 = recievedAnswer2
            str3.append("Regular")
            fourVC.recievedAnswer3 = str3
        }else{
            fourVC.recievedAnswer3 = str3
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker3.delegate = self
        picker3.dataSource = self
        
        // Do any additional setup after loading the view.
        print(recievedAnswer2)
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
