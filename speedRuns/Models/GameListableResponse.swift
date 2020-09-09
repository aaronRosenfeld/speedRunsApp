//
//  GameListableResponse.swift
//  speedRuns
//
//  Created by Aaron Rosenfeld on 9/9/20.
//  Copyright © 2020 Aaron Rosenfeld. All rights reserved.
//

import Foundation

struct GameListableResponseData: Decodable {
    var data: [GameListableResponse]
}

struct GameListableResponse: Decodable {
    struct Name: Decodable {
        var twitch: String?
    }
    struct Cover: Decodable {
        var uri: String?
    }
    struct Assets: Decodable {
        var cover_large: Cover?
        
        enum CodingKeys: String, CodingKey {
            case cover_large = "cover-large"
        }
    }
    var names: Name?
    var release_date: String?
    var assets: Assets?
    
    enum CodingKeys: String, CodingKey {
        case names
        case release_date = "release-date"
        case assets
    }
}
