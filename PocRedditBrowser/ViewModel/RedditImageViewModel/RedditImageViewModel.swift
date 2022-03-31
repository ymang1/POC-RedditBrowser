//
//  RedditImageViewModel.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/**
 Reddit Image View Model used for getting reddit data from url
 */
struct RedditImageViewModel {
    var redditChildrenDataList: [RedditChildrenModel]?
    
    /// Get reddit data from URL
    /// - Parameter completionHandler: gives RedditImageViewModel if data fetched successfully from URL otherwise give error
    static func getRedditData(completionHandler: @escaping(RedditImageViewModel?, String?) -> Void) {
        let urlStr = UrlConstant.redditPicsUrl
        POCNetworkManager.sharedManager.makeGetRequest(urlString: urlStr) { (result) in
            switch result {
            case .success(let data):
                do {
                    let redditModel = try JSONDecoder().decode(RedditModel.self, from: data)
                    let redditImageViewModel = RedditImageViewModel(redditChildrenDataList: redditModel.data?.children)
                    completionHandler(redditImageViewModel, nil)
                } catch {
                    completionHandler(nil,error.localizedDescription)
                }
                
            case .failure(let err):
                completionHandler(nil,err.localizedDescription)
            }
        }
    }
}
