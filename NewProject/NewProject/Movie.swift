//
//  Movie.swift
//  NewProject
//
//  Created by Macbook Pro 2017 on 09/01/2022.
//

import Foundation
struct Movie: Decodable {
    var name: String
    var rating: String
    var dateRelease: String
    var posterImg: String
}
