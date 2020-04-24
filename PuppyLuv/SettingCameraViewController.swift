//
//  SettingCameraViewController.swift
//  PuppyLuv
//
//  Created by Athena Enosara on 4/13/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit
import AlamofireImage
import Parse
class SettingCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileDisplayNameField: UITextField!
    @IBOutlet weak var profileDescriptionField: UITextField!
    
    
    @IBAction func submitImageButton(_ sender: Any) {
        
        
        let userInfo = PFObject(className: "UserProfile")
              
        userInfo["display_name"] = profileDisplayNameField.text!
        userInfo["description"] = profileDescriptionField.text!
        userInfo["username"] = PFUser.current()!.username
        userInfo["author"] = PFUser.current()!
        
        let imageData = settingImageView.image!.pngData()
        let imageFile = PFFileObject(data: imageData!)
        
        userInfo["image"] = imageFile
        
        userInfo.saveInBackground{ (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error!")
                print(error as Any)
            }
        }
    }
    
    
    
    @IBOutlet weak var settingImageView: UIImageView!
        
    @IBAction func onTapCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        settingImageView.image = scaledImage
        dismiss(animated: true, completion: nil)
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
