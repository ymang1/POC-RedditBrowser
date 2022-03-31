//
//  RedditModel.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import Foundation

/// redit model structure
struct RedditModel: Decodable {
    let kind: String?
    let data: RedditDataModel?
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.data = try container.decodeIfPresent(RedditDataModel.self, forKey: .data)
    }
}
