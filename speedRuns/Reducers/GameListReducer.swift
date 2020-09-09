//
//  GameListReducer.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import ReSwift

func gameListReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case _ as GetGamesListAction:
        var list: [GameListable] = []
        for i in 0 ... 9 {
            list.append(GameListable(name: "Game \(i)"))
        }
        state.gamesList = list
    default:
        break
    }
    
    return state
}
