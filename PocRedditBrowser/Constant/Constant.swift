//
//  Constant.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// URL constant file
struct UrlConstant {
    static let redditPicsUrl = "http://www.reddit.com/r/pics/.json?jsonp="
}

/// Device size with width and height
struct DeviceSize {
    static let screenBounds = UIScreen.main.bounds
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenWidth = UIScreen.main.bounds.size.width
}

/// Constants for internet error message
struct InternetErrorMessage {
    static let noDataFoundMessage = "No Data Found."
    static let somethingWentWrongMessage = "Something Went Wrong."
    static let noInternetMessage = "Please check your internet connection."
}

///  Constant for userdefault keys
struct FavoriteImageUserDefault {
    static let radditFavoriteImage = "radditFavoriteImage"
}
