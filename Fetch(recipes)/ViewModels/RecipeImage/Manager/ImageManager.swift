//
//  ImageManager.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//

import Foundation
import SwiftUI

@MainActor
final class ImageManager {
    
    var imageCache: NSCache<NSString, NSData> = {
        let cache = NSCache<NSString, NSData>()
        cache.countLimit = 100
        cache.totalCostLimit = 10 * 1024 * 1024
        return cache
    }()
    
    func downloadImage(url: String) async throws -> Data?  {
        guard let imageUrl = URL(string: url) else {
            throw ImageDownloadError.invalidURL
        }
        
        do {
              let data = try await URLSession.shared.data(from: imageUrl).0
              return data
          } catch {
              throw ImageDownloadError.noData
          }
    }
    
    func cacheFetchedImage(image: NSData, name: String){
            imageCache.setObject(image, forKey: name as NSString)
    }
 
    func getImageFromCache(imageName: String?) -> NSData? {
        guard let name = imageName else { return nil }
        return imageCache.object(forKey: name as NSString)
   
    }
}


enum ImageDownloadError: Error {
    case invalidURL
    case noData
}
