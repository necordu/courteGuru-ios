//
//  CGCart.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit

extension CGCart {
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl
        case currency
        case price
        case goodCount
    }

}

struct CGCart: Codable {
    
    public let name: String
    public let price: Int
    public let imageUrl: String
    public let goodCount: Int
    public let currency: String
    
    init(name: String,
                price: Int,
                imageUrl: String,
                goodsCount: Int,
                currency: String) {
      self.name = name
      self.price = price
      self.imageUrl = imageUrl
      self.goodCount = goodsCount
      self.currency = currency
    }

}
