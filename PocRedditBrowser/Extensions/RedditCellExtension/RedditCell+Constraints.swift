//
//  RedditCell+Constraints.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Extension for reddit cell constraints
extension RedditCell {
    func setConstraints() {
        thumbnailImage.widthAnchor.constraint(equalToConstant:100.0).isActive = true
        thumbnailImage.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        // in this case edge insets will be 10 per each side
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            hStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            hStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        ])
    }
}
