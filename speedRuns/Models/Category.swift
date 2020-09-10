//
//  Category.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import Foundation

struct CategoriesResponseData: Decodable {
    var data: [Category]
}

struct Category: Decodable {
    var id: String?
    var name: String?
    var rules: String?
}
