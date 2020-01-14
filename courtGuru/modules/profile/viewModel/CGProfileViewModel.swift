//
//  CGProfileViewModel.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import Foundation
import RxCocoa

protocol CGProfileViewModelProtocol {
    
    var goods: BehaviorRelay<[CGCart]> { get }
    
}
