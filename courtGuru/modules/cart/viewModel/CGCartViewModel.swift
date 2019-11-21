//
//  CGCartViewModel.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol CGCartViewModelProtocol {
    
    var goods: BehaviorRelay<[CGCart]> { get }
    
    func cartChange(_ sender: UIButton, goodCount: Int) -> String
    
    func countPrice(price: Int, goodCount: String) -> String
    
    func getGoods() -> Observable<[CGCart]>
    
}
