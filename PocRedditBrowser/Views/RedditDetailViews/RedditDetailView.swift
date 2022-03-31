//
//  RedditDetailView.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// RedditDetailView for showing view of reddit detail view controller
class RedditDetailView: UIView {
    var imageUrl = ""
    
    lazy var redditImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "reddit_placeholder"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitle("Favorite", for: .normal)
        button.addTarget(self, action: #selector(self.handleButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set up reddit detail view
    func setUpView() {
        self.backgroundColor = .white
        self.addSubview(redditImage) // add reddit imageview
        self.addSubview(favoriteButton) // add favorite button
        self.addSubview(titleLabel) // add title label
        self.addSubview(authorLabel) // add author label
        setConstraints()
    }
    
    /// redditChildrenModel: contains the reddit children data
    var redditChildrenModel: RedditChildrenModel? {
        didSet {
            titleLabel.text = redditChildrenModel?.data?.title
            if let imageUrl = redditChildrenModel?.data?.url {
                loadImage(imageUrl)
                self.imageUrl = imageUrl
                setFavoriteButtonTitle(imageUrl)
            }
            authorLabel.text = redditChildrenModel?.data?.author != nil ? "Author: " + (redditChildrenModel?.data?.author)! : ""
        }
    }
    
    /// Set favorite/ unfavorite button title
    /// - Parameter imageUrl: use image url as key for storing favorite/ unfavorite data in userdefault
    func setFavoriteButtonTitle(_ imageUrl: String) {
        let favoritedData = RedditUserDefault.shared.getFavoriteData()
        if Array(favoritedData.keys).contains(imageUrl) {
            if let favoritedValue = favoritedData[imageUrl], favoritedValue {
                favoriteButton.setTitle("Unfavorite", for: .normal)
            } else {
                favoriteButton.setTitle("Favorite", for: .normal)
            }
        } else {
            favoriteButton.setTitle("Favorite", for: .normal)
        }
    }
    
    /// Action on favorite/ unfavorite button
    /// - Parameter button: favorite/ unfavorite UIButton
    @objc private func handleButtonAction(_ button: UIButton) {
        let title = RedditDetailViewModel.handleButtonAction(self.imageUrl)
        favoriteButton.setTitle(title, for: .normal)
    }
}

extension RedditDetailView {
    // MARK:-  Load Image
    private func loadImage(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        POCNetworkManager.sharedManager.downloadImage(url: url) {(image, err) in
            if err == nil {
                DispatchQueue.main.async {
                    if let image = image {
                        self.redditImage.image = image
                    }
                }
            }
        }
    }
}
