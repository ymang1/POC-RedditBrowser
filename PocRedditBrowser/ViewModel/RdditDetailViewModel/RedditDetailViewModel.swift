//
//  RedditDetailViewModel.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 31/03/22.
//

import Foundation

/**
 Reddit Image View Model used for getting reddit data from url
 */
struct RedditDetailViewModel {
    static func handleButtonAction(_ imageUrl: String) -> String {
        var favoritedData = RedditUserDefault.shared.getFavoriteData()
        var buttonTitle = "Unfavorite"
        if Array(favoritedData.keys).contains(imageUrl) {
            if let favoritedValue = favoritedData[imageUrl], favoritedValue {
                favoritedData[imageUrl] = false
                buttonTitle = "Favorite"
            } else {
                favoritedData[imageUrl] = true
                buttonTitle = "Unfavorite"
            }
        } else {
            favoritedData[imageUrl] = true
            buttonTitle = "Unfavorite"
        }
        RedditUserDefault.shared.setFavoriteData(favoritedData)
        return buttonTitle
    }
}
