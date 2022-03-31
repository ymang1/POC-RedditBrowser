//
//  UITableView+Extension.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import UIKit

/// Extension for UITableview
extension UITableView {
    /// Set label on tableview if data is not present
    /// - Parameter message: message shown when data not available
    func setNoDataMessage(_ message: String = InternetErrorMessage.noDataFoundMessage) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: DeviceSize.screenWidth - 32.0, height: DeviceSize.screenHeight))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 20.0)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restoreData() {
        self.backgroundView = nil
    }
}
