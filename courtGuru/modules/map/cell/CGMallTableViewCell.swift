//
//  CGMallTableViewCell.swift
//  courtGuru
//
//  Created by Егор Редько on 28/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit

class CGMallTableViewCell: UITableViewCell {
    @IBOutlet var imageMall: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    static let Identifier = "CGMallCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
