//
//  CGCartViewModelIn.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire

class CGCartViewModelIn: NSObject, CGCartViewModelProtocol {
    
    var goods: BehaviorRelay<[CGCart]> = BehaviorRelay<[CGCart]>(value: [])
    
    enum GetGoodssFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
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
        
        
    }

}


//Request related with cart
extension CGCartViewModelIn {
    
    func getGoods() -> Observable<[CGCart]> {
        
        return Observable.create { (observer) -> Disposable in
            
            AF.request("https://api.myjson.com/bins/1e5y5a")
            .validate()
            .responseJSON { (response) in
                    switch response.result {
                    case .success:
                        guard let data = response.data else{
                            observer.onError(response.error ?? GetGoodssFailureReason.notFound)
                            return
                        }
                        do {
                            let goods = try JSONDecoder().decode([CGCart].self, from: data)
                            observer.onNext(goods)
                        } catch {
                            observer.onError(error)
                        }
                     case .failure(let error):
                     if let statusCode = response.response?.statusCode,
                         let reason = GetGoodssFailureReason(rawValue: statusCode)
                     {
                         observer.onError(reason)
                     }
                     observer.onError(error)
                    }
            }
            return Disposables.create()
            
        }
        
    }
    
}
