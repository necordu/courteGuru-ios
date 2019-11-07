//
//  CGCartViewModelIn.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import RxCocoa

class CGCartViewModelIn: NSObject, CGCartViewModelProtocol {
    
    var goods: BehaviorRelay<[CGCart]> = BehaviorRelay<[CGCart]>(value: [])
    
    func cartChange(_ sender: UIButton, goodCount: Int) -> String {
        
        var goodCount = goodCount
        switch sender.tag {
        case 1:
            if goodCount == 1 {
                break
            } else {
                goodCount = goodCount - 1
            }
            print("minus")
            break
        case 2:
            goodCount = goodCount + 1
            print("plus")
            break
        default:
            print("err")
        }
        
        return String(goodCount)
        
    }
    
    func countPrice(price: Int, goodCount: String) -> String {
        
        return String(price * Int(goodCount)!)
        
    }
    
    override init() {
        
        goods.accept(Utilities.createData())
        
    }

}
