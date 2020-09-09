//
//  Thunks.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import ReSwift
import ReSwiftThunk

func getGameListThunk(_ query: String) -> Thunk<AppState> {
    return Thunk<AppState> { dispatch, getState in
        guard let state = getState() else { return }
        
        var list: [GameListable] = []
        searchGames(query: query) { result in
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
                dispatch(SetGameListAction(gameList: list))
            }
        }
    }
}
