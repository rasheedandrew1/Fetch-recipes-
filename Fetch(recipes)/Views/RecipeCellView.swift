//
//  RecipeCellView.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//

import SwiftUI

struct RecipeCellView: View {
    var recipe: Recipe?
    var body: some View {
        
        if let recipe = recipe {
           
                HStack {
                    if let image = recipe.photoUrlSmall {
                        RecipeImage(imageUrlPath: image, imageName: recipe.name, largeImage: false)
                    }
                    VStack(alignment: .leading) {
                        RecipeName(recipeName: recipe.name, detailView: false)
                        CuisineType(recipeCuisine: recipe.cuisine, detailView: false)
                    }
                }
        }
        
    }
}

#Preview {
    RecipeCellView()
}
