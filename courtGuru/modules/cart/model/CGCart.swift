//
//  CGCart.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit

class CGCart: NSObject {
    
   /* public enum Rarity {
       case common
       case uncommon
       case rare
       case veryRare
     }
     
     public let name: String
     public let birthday: Date
     public let rarity: Rarity
     public let image: UIImage
     
     public init(name: String,
                 birthday: Date,
                 rarity: Rarity,
                 image: UIImage) {
       self.name = name
       self.birthday = birthday
       self.rarity = rarity
       self.image = image
     }*/
    
    /*struct CartModel {
        
        let name: String
        let price: NSNumber
        let imageUrl: String
        let goodsCount: NSNumber
        
    }*/
    
    public let name: String
    public let price: NSNumber
    public let imageUrl: String
    public let goodsCount: NSNumber
    public let currency: String
    
    public init(name: String,
                price: NSNumber,
                imageUrl: String,
                goodsCount: NSNumber,
                currency: String) {
      self.name = name
      self.price = price
      self.imageUrl = imageUrl
      self.goodsCount = goodsCount
      self.currency = currency
    }

}
