//
//  DogFeedCell.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/17/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit
import Parse

class DogFeedCell: UITableViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!

    @IBOutlet var likeButton: UIButton!
    
    var objectID:String? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    
//    var delegate: DogFeedCell
    
    var favorited:Bool = false
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if favorited {
            likeButton.setImage(UIImage(named: "filledP"), for: UIControl.State.normal)
        }else{
            likeButton.setImage(UIImage(named: "notfilledP"), for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func heartClicked(_ sender: UIButton) {


        let toBeFavored = !favorited
       if toBeFavored {
        setFavorite(toBeFavored)
        saveImageToParser()
        print("favored image ")
       }else{
        setFavorite(toBeFavored)
        dislikeImageToParser()
        print("disliked images")
       }

    }
    
    
    func updateLikedColumTrue(){
        
        let query = PFQuery(className:"DogFeed")
        
        query.getObjectInBackground(withId: "Ed7AodAq9G") { (liked: PFObject?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let liked = liked {
                print("the image has been updated")
                liked["liked"] = true
                liked.saveInBackground()
            }
        }
    }
    func updateLikedColumFalse(){
        let query = PFQuery(className:"DogFeed")
        
        query.getObjectInBackground(withId: "Ed7AodAq9G" ) { (liked: PFObject?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let liked = liked {
                liked["liked"] = false
                liked.saveInBackground()
            }
        }
    }
    
    
    func saveImageToParser(){
        let dog = PFObject(className:"LikedDogs")
        let imageData = photoView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        dog["user"] = PFUser.current()
        dog["image"] = file
        dog["liked"] = true
        
        dog.saveInBackground { (succeeded, error)  in
            if (succeeded) {
                // The object has been saved.
                print("dog image liked and saved")
            } else {
                // There was a problem, check error.description
                print("Problem saving")
                
            }
        }
    }
    func dislikeImageToParser(){
        let dog = PFObject(className:"LikedDogs")
        let imageData = photoView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        dog["user"] = PFUser.current()
        dog["image"] = file
        dog["liked"] = false
        
        dog.saveInBackground { (succeeded, error)  in
            if (succeeded) {
                // The object has been saved.
                print("correctly disliked an image")
            } else {
                // There was a problem, check error.description
                print("Problem disliking")
            }
        }
//        query.getObjectInBackground(withId: objectID! ) { (liked: PFObject?, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let liked = liked {
//                liked["liked"] = false
//                liked.saveInBackground()
//            }
//        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
