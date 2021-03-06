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
    
    @IBOutlet weak var temperamentLabel: UILabel!
    
    @IBOutlet weak var infoTemperamentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ResultImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

