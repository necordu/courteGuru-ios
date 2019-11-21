//
//  CGCartCell.swift
//  courtGuru
//
//  Created by Егор Редько on 30.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import SnapKit

class CGCartCell: UITableViewCell {
    
    var goodPrice: Int!
    var goodCurrency: String!
    
    var goods: CGCart? {
        didSet{
            guard let good = goods else { return }
            
            self.goodPrice = good.price
            self.goodCurrency = good.currency
            
            
            self.nameLabel.text = good.name
            self.goodsCount.text = String(good.goodCount)
            self.priceLabel.text = String(good.price * good.goodCount) + " " + good.currency
        }
    }

    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var minus: UIButton!
    @IBOutlet var plus: UIButton!
    @IBOutlet var goodsCount: UILabel!
    
    static let Identifier = "cartCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        
        self.plus.layer.cornerRadius = 8
        
        self.minus.layer.cornerRadius = 8
        
       /* goodsCount.sizeToFit()
        self.minus.snp.updateConstraints { (make) in
            make.trailing.equalTo(goodsCount.snp.leading)
        }*/
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
