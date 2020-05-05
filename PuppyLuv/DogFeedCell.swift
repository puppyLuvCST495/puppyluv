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

    @IBOutlet weak var likeButton: UIButton!
    
    
    var view = FeedViewController().objectID
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
        
    var favorited:Bool = false
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if favorited {
            likeButton.setImage(UIImage(named: "filledP"), for: UIControl.State.normal)
            favorited = true
        }else{
            likeButton.setImage(UIImage(named: "notfilledP"), for: UIControl.State.normal)
            favorited = false
        }
    }
    
        
    func heartClicked(){
        let toBeFavored = !favorited
               if toBeFavored {
                setFavorite(toBeFavored)
               }else{
                setFavorite(toBeFavored)
                print("disliked images")
               }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
