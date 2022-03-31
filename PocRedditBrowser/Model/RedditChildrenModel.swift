//
//  RedditChildrenModel.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import Foundation

/// Reddit children model structure which contains data list of children model
struct RedditChildrenModel: Decodable {
    let kind: String?
    let data: RedditChildrenDataModel?
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case data = "data"
    }
    
    init(kind: String?, data: RedditChildrenDataModel?) {
        self.kind = kind
        self.data = data
    }
}
