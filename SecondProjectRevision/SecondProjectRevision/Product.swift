//
//  Product.swift
//  SecondProjectRevision
//
//  Created by Macbook Pro 2017 on 05/12/2021.
//

import Foundation
struct Product: Decodable {
    var name: String
    var price: Double
    var image: String
    var quantite: Int = 0
    enum CodingKeys: String, CodingKey {
        case name
        case price
        case image
    }
}
