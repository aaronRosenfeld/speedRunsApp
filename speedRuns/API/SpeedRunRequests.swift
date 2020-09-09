//
//  SpeedRunRequests.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import Foundation

enum RequestErorr: Error {
    case noData
    case cannotProcess
}

func searchGames(query: String, completion: @escaping(Result<GameListableResponseData, Error>) -> Void) {
    let urlSafeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    guard let url = URL(string: "https://www.speedrun.com/api/v1/games?name=\(urlSafeQuery)") else { fatalError() }
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        if let error = error { completion(.failure(error)) }
        guard let jsonData = data else {
            completion(.failure(RequestErorr.noData))
            return
        }
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(GameListableResponseData.self, from: jsonData)
            completion(.success(response))
        } catch {
            completion(.failure(RequestErorr.cannotProcess))
        }
    }
    dataTask.resume()
}
