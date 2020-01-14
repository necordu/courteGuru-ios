//
//  CGProfileViewModelIn.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import RxCocoa

class CGProfileViewModelIn: NSObject, CGProfileViewModelProtocol {
    
    var goods: BehaviorRelay<[CGCart]>  = BehaviorRelay<[CGCart]>(value: [])
    
    override init() {
        
        goods.accept(Utilities.createData())
        
    }
    
    
    

}
