//
//  RedditViewController.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit
import SVProgressHUD

/// RedditViewController used for showing image with title and timestamp
class RedditViewController: UIViewController {
    let redditReuseIdentifier = "RedditCellIdentifier"
    let tableview = UITableView()
    var redditImageViewModel: RedditImageViewModel?
    var searchController: UISearchController?
    var shouldShowSearchResults = false
    var searchResultArray: [RedditChildrenModel]?
    
    /// View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        setUpInitials()
    }
    
    /// Configure Table View
    private func configureTableView() {
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 80.0
        tableview.register(RedditCell.self, forCellReuseIdentifier: redditReuseIdentifier)
        tableview.backgroundView?.backgroundColor = UIColor.white
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    /// Checking network connectivity afterwards trying ti fetch data from URL
    private func setUpInitials() {
        if Reachability.isConnectedToNetwork() {
            SVProgressHUD.setContainerView(self.view)
            RedditImageViewModel.getRedditData() { [weak self] (redditImageViewModel, errorMsg) in
                if errorMsg == nil {
                    self?.redditImageViewModel = redditImageViewModel
                    DispatchQueue.main.async {
                        if redditImageViewModel != nil {
                            self?.configureSearchController()
                        }
                        self?.tableview.reloadData()
                    }
                } else {
                    print(InternetErrorMessage.somethingWentWrongMessage)
                }
            }
        } else {
            print(InternetErrorMessage.noInternetMessage)
        }
    }
    
    /// Configure search controller
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.placeholder = "Search"
        searchController?.searchBar.delegate = self
        searchController?.searchBar.sizeToFit()
        tableview.tableHeaderView = searchController?.searchBar
    }
}
