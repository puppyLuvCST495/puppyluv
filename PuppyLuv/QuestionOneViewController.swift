//
//  QuestionsViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/1/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit

class QuestionOneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  

    @IBOutlet weak var question1: UITextView!
    @IBOutlet weak var picker: UIPickerView!
    
    let answers = ["Small","Medium","Big"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
          return answers[row]
      }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers.count
        }
    
     
    func pickerView(_ pickerView: UIPickerView, didSelect row: Int, inComponent component: Int)  {
        question1.text = answers[row]
      }
    
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
