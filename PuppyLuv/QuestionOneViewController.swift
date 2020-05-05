//
//  QuestionsViewController.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/1/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit

class QuestionOneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  

    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var question1: UITextView!
    @IBOutlet weak var picker: UIPickerView!
    
    let answers = ["Select One","Independent","Easy to Train","Agreeable","May be Stubborn","Eager to Please"]
    var str = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        str = [String]()
        return str.append(answers[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondVC: QuestionTwoViewController = segue.destination as! QuestionTwoViewController
        
       // if str == []{
         //   str = answers
           // str.append("Yes")
            //secondVC.recievedAnswer = str
        //}else{
            secondVC.recievedAnswer = str
        //}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        nextButton.layer.cornerRadius = 10
        

        // Do any additional setup after loading the view.
    }
    
    
    
}
