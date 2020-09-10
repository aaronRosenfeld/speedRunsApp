//
//  Actions.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import ReSwift

struct SetGameListAction: Action {
    let gameList: [GameListable]
}
struct SetCategoriesAction: Action {
    let categories: [Category]
}
