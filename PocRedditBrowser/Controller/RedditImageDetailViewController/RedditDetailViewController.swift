//
//  RedditDetailViewController.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Reddit detail view controller used for showing actual image with favorite/ unfavorite feature as well as title and author
class RedditDetailViewController: UIViewController {
    let redditDetailView = RedditDetailView()
    
    /// RedditChildrenModel which has the detail of children
    var redditChildrenModel: RedditChildrenModel? {
        didSet {
            if let model = redditChildrenModel {
                redditDetailView.redditChildrenModel = model
            }
        }
    }
    
    /// View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = redditDetailView
    }
}
