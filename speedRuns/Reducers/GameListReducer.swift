//
//  GameListReducer.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import ReSwift
import Nuke

func gameListReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case let action as SetGameListAction:
        state.gamesList = action.gameList
    default:
        break
    }
    
    return state
}
