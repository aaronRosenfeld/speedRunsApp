//
//  AppState.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var gamesList: [GameListable] = []
    var categories: [Category] = []
}
