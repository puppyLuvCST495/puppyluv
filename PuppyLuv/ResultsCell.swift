//
//  ResultsCell.swift
//  PuppyLuv
//
//  Created by Rosario on 4/22/20.
//  Copyright © 2020 Athena Enosara. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {
    
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var breed: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var ResultImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

