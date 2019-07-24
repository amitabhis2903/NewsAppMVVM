//
//  Extension.swift
//  NewsAppMVVM
//
//  Created by A on 24/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation
import UIKit


//Image cache implemented
let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageURL: String?
    
    func downloadImageFromUrl(urlString: String) {
        imageURL = urlString
        guard let url = URL(string: urlString) else {
            return
        }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                if let imageToCache = UIImage(data: data) {
                    if self.imageURL == urlString {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                }
            }
            }.resume()
    }
}
