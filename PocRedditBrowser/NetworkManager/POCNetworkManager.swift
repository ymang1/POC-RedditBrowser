//
//  POCNetworkManager.swift
//  PocRedditBrowser
//
//  Created by Yukti Mangla on 30/03/22.
//

import Foundation
import SVProgressHUD

/// enum for network error
enum NetworkError: Error {
    case domainError
}

/// Newtwork Manager class used for API calls
class POCNetworkManager {
    static let sharedManager = POCNetworkManager()
    static let imageCache = NSCache<AnyObject, UIImage>()
    
    /// Get Request API call
    /// - Parameters:
    ///   - urlString: url string for making API calls
    ///   - completion: return data result if get data from URL otherwise return domain error
    func makeGetRequest(urlString: String, completion:@escaping (Result<Data,NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.domainError))
            return
        }
        SVProgressHUD.show()
        URLSession.shared.dataTask(with: url) { data, response, error in
            SVProgressHUD.dismiss()
            guard let urlData = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                }
                return
            }
            
            let str = String(data: urlData, encoding: .isoLatin1)
            guard let dataUTF8 = str?.data(using: .utf8) else {
                return
            }
            completion(.success(dataUTF8))
        }.resume()
    }
    
    /// Download Image from URL
    /// - Parameters:
    ///   - url: URL from where need to download image
    ///   - completion: return image in case success otherwise return domain error
    func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        if let cachedImage = POCNetworkManager.imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    
                } else if let urlData = data, let image = UIImage(data: urlData) {
                    POCNetworkManager.imageCache.setObject(image, forKey: url.absoluteString as AnyObject)
                    completion(image, nil)
                } else {
                    completion(nil, NetworkError.domainError)
                }
            }.resume()
        }
    }
}
