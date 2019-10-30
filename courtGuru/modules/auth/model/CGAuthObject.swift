//
//  CGAuthObject.swift
//  courtGuru
//
//  Created by Егор Редько on 28/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit

extension Auth {
    enum CodingKeys: String, CodingKey {
        case token
    }

}
    
struct Auth: Codable {
    let token: String
    
}
