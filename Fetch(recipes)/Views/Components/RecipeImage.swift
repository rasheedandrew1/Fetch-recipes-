//
//  RecipeImage.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//

import SwiftUI

struct RecipeImage: View {
    
    @StateObject private var vm: RecipeImageViewModel = RecipeImageViewModel(imageManager: ImageManager())
    var imageUrlPath : String
    var imageName: String
    var largeImage: Bool
    var body: some View {
        campaignPicture
            .task {
                self.vm.imageName = imageName
                self.vm.imageUrl = imageUrlPath
                await self.vm.processImageUrl()
            }
         
    }
}

#Preview {
    RecipeImage(imageUrlPath: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/large.jpg", imageName: "shortcake", largeImage: false)
}

extension RecipeImage {
    private var campaignPicture: some View {
        Group {
            if let imageData = vm.downloadedData {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: largeImage ? .infinity : 50, height: largeImage ? 350 : 50)
                        .cornerRadius(5.0)
                        .clipped()
                } else {
                    Text("No image")
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
            else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}
