//
//  RedditViewController+UITableViewDelegate.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Extension for tableview delegate for RedditViewController
extension RedditViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if redditImageViewModel?.redditChildrenDataList?.isEmpty ?? false || redditImageViewModel == nil {
            tableView.setNoDataMessage()
        } else {
            tableView.restoreData()
        }
        return shouldShowSearchResults ? searchResultArray?.count ?? 0 : redditImageViewModel?.redditChildrenDataList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let redditCell = tableview.dequeueReusableCell(withIdentifier: redditReuseIdentifier, for: indexPath) as? RedditCell else {
            return UITableViewCell()
        }

        redditCell.imageDelegate = self
        if let redditChildrenDataList = redditImageViewModel?.redditChildrenDataList, !shouldShowSearchResults {
            redditCell.configureTableViewCell(redditChildrenDataList, indexPath)
        } else if let searchResult = searchResultArray, shouldShowSearchResults {
            redditCell.configureTableViewCell(searchResult, indexPath)
        }
        return redditCell
    }
}
