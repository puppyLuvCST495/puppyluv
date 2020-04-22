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

    @IBAction func submitImageButton(_ sender: Any) {
//            let user = PFObject(className: "User")
//
        let imageData = settingImageView.image!.pngData()
//            let file = PFFileObject(name: "profileImage.png", data: imageData!)
//
//            user["profile_img"] = file
//            user["author"] = PFUser.current()
//
//            user.saveInBackground{ (success, error) in
//                if success{
//                    self.dismiss(animated: true, completion: nil)
//                    print("saved!")
//                } else {
//                    print("error!")
//                    print(error as Any)
//                }
//            }
        
        let imageFile = PFFileObject(name: "profileImage.png", data: imageData!)
//        imageFile?.save()
        let user = PFUser.current()
        user?.setObject(imageFile as Any, forKey: "profile_img")
        user?.saveInBackground(block: { (success, error) in
            if(success){
                print("saved!")
                self.dismiss(animated: true, completion: nil)
                print("dismissing view")
            } else {
                print("error!")
                print(error as Any)
            }
        })
        
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
