//
//  GameListable.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import UIKit

class GameListable {
    var id: String?
    var name: String?
    var releaseDate: String?
    var imageURL: String?
    
    init(id: String?, name: String?, releaseDate: String?, imageURL: String?) {
        self.id = id
        self.name = name
        self.releaseDate = releaseDate
        self.imageURL = imageURL
    }
}
