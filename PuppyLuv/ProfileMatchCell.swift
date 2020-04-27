//
//  ProfileMatchCell.swift
//  PuppyLuv
//
//  Created by Pernille Dahl on 4/26/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//
import UIKit

class ProfileMatchCell: UITableViewCell {
    
    @IBOutlet weak var matchBreedLabel: UILabel!
    @IBOutlet weak var matchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
