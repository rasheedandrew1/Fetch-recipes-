//
//  RecipeImageViewModel.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//


import Combine
import UIKit

@MainActor
class RecipeImageViewModel: ObservableObject, RecipeImageProtocol {
 
    @Published var imageName: String?
    @Published var imageUrl: String?
    @Published var cachedImage: NSData?
    @Published var downloadedData: Data?
    
    var imageManager: ImageManager
    
    required init (imageManager: ImageManager) {
        self.imageManager = imageManager
    }
    
    func downloadImage(url: String) async -> Data? {
        do {
            let data = try await imageManager.downloadImage(url: url)
            return data
        } catch {
            return nil
        }
    }
    
    @MainActor
        func getImageFromCache() async -> NSData? {
            return imageManager.getImageFromCache(imageName: self.imageName)
        }
    
    @MainActor
    func processImageUrl() async {
        Task {
            do {
                let savedImage = await getImageFromCache()
                if savedImage == nil {
                    guard let name = imageName else {
                        return
                    }
                    guard let url = imageUrl else {
                        return
                    }
                    guard let data = await downloadImage(url: url) else {
                        return
                    }
                    print("\(data.description)")
                    self.downloadedData = data
                    
                    imageManager.cacheFetchedImage(image: data as NSData, name: name)
                    
                }
            }
        }
    }
    
}



