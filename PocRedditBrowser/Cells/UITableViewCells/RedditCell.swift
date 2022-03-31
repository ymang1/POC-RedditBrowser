//
//  RedditCell.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Delegate for Reddit Image
protocol RedditImageDelegate: AnyObject {
    /// Action performed on thumbnail image tapped
    /// - Parameters:
    ///   - index: on which index image is tapped
    func tapOnThumbnailImage(_ index: Int)
}

/// RedditCell for RedditViewController
class RedditCell: UITableViewCell {
    weak var imageDelegate: RedditImageDelegate?
    
    lazy var thumbnailImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "reddit_placeholder"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var timestampLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let vStackView = UIStackView(arrangedSubviews: [titleLabel, timestampLabel])
        vStackView.axis = .vertical
        vStackView.distribution = .fill
        vStackView.alignment = .leading
        vStackView.spacing = 5
        return vStackView
    }()
    
    lazy var hStackView: UIStackView = {
        let hStackView = UIStackView(arrangedSubviews: [thumbnailImage, vStackView])
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.alignment = .top
        hStackView.spacing = 10
        return hStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(hStackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configure table view cell
    /// - Parameters:
    ///   - redditChildrenList: list of reddit children model
    ///   - indexPath: table cell indexpath
    func configureTableViewCell(_ redditChildrenList: [RedditChildrenModel], _ indexPath: IndexPath) {
        self.selectionStyle = .none
        let redditChildrenModel = redditChildrenList[indexPath.row]
        titleLabel.text = redditChildrenModel.data?.title
        if let imageUrl = redditChildrenModel.data?.thumbnail {
            loadImage(imageUrl)
        }
        let date = Date(timeIntervalSince1970: Double(redditChildrenModel.data?.created ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        timestampLabel.text = dateFormatter.string(from: date)
        
        tapGestureOnImage(indexPath)
    }
}

extension RedditCell {
    // MARK:-  Load Image
    private func loadImage(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        POCNetworkManager.sharedManager.downloadImage(url: url) { [weak self] (image, err) in
            guard let weakSelf = self else { return }
            if err == nil {
                DispatchQueue.main.async {
                    if let image = image {
                        weakSelf.thumbnailImage.image = image
                    }
                }
            }
        }
    }
    
    /// Tap gesture on image
    /// - Parameter indexPath: table cell indexpath
    private func tapGestureOnImage(_ indexPath: IndexPath) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTappedMethod(_:)))
        thumbnailImage.isUserInteractionEnabled = true
        thumbnailImage.tag = indexPath.row
        thumbnailImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// image tapped method
    /// - Parameter sender: AnyObject
    @objc func imageTappedMethod(_ sender:AnyObject) {
        self.imageDelegate?.tapOnThumbnailImage(sender.view?.tag ?? 0)
    }
}
