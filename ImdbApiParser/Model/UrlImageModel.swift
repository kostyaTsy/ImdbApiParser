//
//  UrlImageModel.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 26.05.22.
//

import Foundation
import UIKit

class UrlImageModel: ObservableObject {
    @Published var uiImage: UIImage?
    var urlString: String
    var imageCache = ImageCache.getInstance()
    
    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }
    
    // Loading image
    func loadImage() {
        // Trying to load from cache
        if loadFormCache() {
            print("From cache")
            return
        }
        
        // If image not in cache, load from url
        loadFromUrl()
    }
    
    // Loading from url, if image in cache return true
    func loadFormCache() -> Bool {
        guard let cacheImage = imageCache.getCache(forKey: urlString) else { return false }
        uiImage = cacheImage
        return true
    }
    
    // Loading from url
    func loadFromUrl() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                guard let loadedImage = UIImage(data: data) else { return }
                self.imageCache.setCache(forKey: self.urlString, image: loadedImage)
                self.uiImage = loadedImage
            }
        }
        .resume()
    }
}

class ImageCache {
    private static var imageCache = ImageCache()
    static func getInstance() -> ImageCache {
        return imageCache
    }
    
    var cache: NSCache = NSCache<NSString, UIImage>()
    
    func getCache(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func setCache(forKey key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
