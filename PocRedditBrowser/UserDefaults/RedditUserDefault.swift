//
//  RedditUserDefault.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import Foundation

/// Singleton for UserDefaults
struct RedditUserDefault {
    static let shared = RedditUserDefault()
    let userDefault = UserDefaults.standard
    
    /// Get favorite data from UserDefault
    /// - Returns: favorite Data Dictionary
    func getFavoriteData() -> [String: Bool] {
        var favoriteDataDictionary = [String: Bool]()
        if let data = userDefault.value(forKey: FavoriteImageUserDefault.radditFavoriteImage) as? [String: Bool], !data.isEmpty {
            favoriteDataDictionary = data
        }
        return favoriteDataDictionary.isEmpty ? [:] : favoriteDataDictionary
    }
    
    /// Set favorite data to UserDefault
    /// - Parameter favoriteDataDictionary: dictionary for favorite/ unfavorite data
    func setFavoriteData(_ favoriteDataDictionary: [String: Bool]) {
        userDefault.setValue(favoriteDataDictionary, forKey: FavoriteImageUserDefault.radditFavoriteImage)
    }
}
