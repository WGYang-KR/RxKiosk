//
//  MenuItem.swift
//  RxKiosk
//
//  Created by WG Yang on 2022/06/20.
//

import Foundation

struct MenuItem: Decodable {
    var name: String
    var price: Int
}

extension MenuItem: Equatable {
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
}
