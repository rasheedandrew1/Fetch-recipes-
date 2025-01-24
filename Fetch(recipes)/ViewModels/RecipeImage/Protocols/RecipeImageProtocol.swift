//
//  RecipeImageProtocol.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/28/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
protocol RecipeImageProtocol {
    var imageName: String? { get set }
    var imageUrl: String? { get set }
    var cachedImage: NSData? { get }
    var downloadedData: Data? { get }
    init (imageManager: ImageManager)
    func downloadImage(url: String) async -> Data?
    func getImageFromCache() async -> NSData?
    func processImageUrl() async
}

