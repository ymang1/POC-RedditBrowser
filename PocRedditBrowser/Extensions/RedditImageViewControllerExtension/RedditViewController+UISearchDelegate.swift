//
//  RedditViewController+UISearchDelegate.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Extension for search bar delegate for RedditViewController
extension RedditViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        self.tableview.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableview.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableview.reloadData()
        }
        searchController?.searchBar.resignFirstResponder()
    }
}

extension RedditViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else { return }
        
        // Filter the data array and get only those reddit children model that match the search text.
        searchResultArray = redditImageViewModel?.redditChildrenDataList?.filter({ $0.data?.title?.localizedCaseInsensitiveContains(searchString) ?? false })
        if let array = searchResultArray, array.isEmpty {
            shouldShowSearchResults = false
        } else {
            shouldShowSearchResults = true
        }
        // Reload the tableview.
        tableview.reloadData()
    }
}
