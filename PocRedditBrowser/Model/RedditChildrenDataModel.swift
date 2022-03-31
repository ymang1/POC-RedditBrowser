//
//  RedditChildrenDataModel.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import Foundation

/// Reddit children data model structure which contains data of children like title, author, images, and so on
struct RedditChildrenDataModel: Decodable {
    let title: String?
    let author: String?
    let thumbnail: String?
    let url: String?
    let created: Int?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case author = "author"
        case thumbnail = "thumbnail"
        case url = "url"
        case created = "created"
    }
    
    init(title: String? = nil, author: String? = nil, thumbnail: String? = nil, url: String? = nil, created: Int? = nil) {
        self.title = title
        self.author = author
        self.thumbnail = thumbnail
        self.url = url
        self.created = created
    }
}
