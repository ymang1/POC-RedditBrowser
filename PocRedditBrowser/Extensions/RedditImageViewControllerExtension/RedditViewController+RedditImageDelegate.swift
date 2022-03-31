//
//  RedditViewController+RedditImageDelegate.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Extension for image delegate for RedditViewController
extension RedditViewController: RedditImageDelegate {
    func tapOnThumbnailImage(_ index: Int) {
        let redditDetailViewController = RedditDetailViewController()
        redditDetailViewController.redditChildrenModel = redditImageViewModel?.redditChildrenDataList?[index]
        self.present(redditDetailViewController, animated: true, completion: nil)
    }
}
