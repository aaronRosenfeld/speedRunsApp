//
//  GameListable.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import UIKit

class GameListable {
    var name: String?
    var releaseDate: String?
    var imageURL: String?
    
    init(name: String?, releaseDate: String?, imageURL: String?) {
        self.name = name
        self.releaseDate = releaseDate
        self.imageURL = imageURL
    }
}
