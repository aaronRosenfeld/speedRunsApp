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
    case let action as GetGamesListAction:
        var list: [GameListable] = []
        searchGames(query: action.query ?? "") { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let searchData):
                for game in searchData.data {
                    list.append(GameListable(name: game.names?.twitch,
                                             releaseDate: game.release_date,
                                             imageURL: game.assets?.cover_large?.uri))
                    print(game)
                }
            }
        }
        state.gamesList = list
    default:
        break
    }
    
    return state
}
