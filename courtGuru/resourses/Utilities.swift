//
//  Utilities.swift
//  courtGuru
//
//  Created by Егор Редько on 30.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import Foundation
import UIKit

final class Utilities {
    
    static func createData() -> [CGCart] {
        
        let f = CGCart(name: "Hello name", price: 1000, imageUrl: "", goodsCount: 2, currency: "Р")
        
        let s = CGCart(name: "Sd dsadsa ds", price: 17530, imageUrl: "", goodsCount: 9, currency: "Р")
        
        let t = CGCart(name: "Httr", price: 750, imageUrl: "", goodsCount: 1, currency: "Р")
        
        return [f, s, t]
        
    }
   /* static func createData() -> [MRMainModel] {
        
        let ichi = MRMainModel(note: "Входящие", color: UIColor.red, desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor")
        let ni = MRMainModel(note: "На подписание", color: UIColor.green, desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        let san = MRMainModel(note: "Выполненные", color: UIColor.blue, desc: "Lorem ipsum dolor sit amet, consectetur adipiscin")
        return [ichi, ni, san]
        
    }*/
    
}
