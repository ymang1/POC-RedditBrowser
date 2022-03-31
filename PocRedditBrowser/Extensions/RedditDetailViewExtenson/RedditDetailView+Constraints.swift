//
//  RedditDetailView+Constraints.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Extension for reddit detail view onstraints
extension RedditDetailView {
    func setConstraints() {
        let marginGuide = self.layoutMarginsGuide
        
        redditImage.translatesAutoresizingMaskIntoConstraints = false
        redditImage.centerXAnchor.constraint(equalTo: marginGuide.centerXAnchor).isActive = true
        redditImage.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
        redditImage.widthAnchor.constraint(equalToConstant:300.0).isActive = true
        redditImage.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.centerXAnchor.constraint(equalTo: marginGuide.centerXAnchor).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: redditImage.bottomAnchor, constant: 15.0).isActive = true
        favoriteButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: redditImage.leadingAnchor, constant: 10.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 15.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: redditImage.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30.0).isActive = true
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15.0).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        authorLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30.0).isActive = true
    }
}
