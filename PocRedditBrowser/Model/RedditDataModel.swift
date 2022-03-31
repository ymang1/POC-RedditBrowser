//
//  RedditDataModel.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import Foundation

/// Reddit data model structure which contains list of children model as well as other data
struct RedditDataModel: Decodable {
    let after: String?
    let dist: Int?
    let modhash: String?
    let geo_filter: String?
    let children: [RedditChildrenModel]?
    let before: String?
    
    enum CodingKeys: String, CodingKey {
        case after = "after"
        case dist = "dist"
        case modhash = "modhash"
        case geo_filter = "geo_filter"
        case children = "children"
        case before = "before"
    }
    
    init(after: String? = nil, dist: Int? = nil, modhash: String? = nil, geo_filter: String? = nil,  children: [RedditChildrenModel]? = nil, before: String? = nil) {
        self.after = after
        self.dist = dist
        self.modhash = modhash
        self.geo_filter = geo_filter
        self.children = children
        self.before = before
    }
}
