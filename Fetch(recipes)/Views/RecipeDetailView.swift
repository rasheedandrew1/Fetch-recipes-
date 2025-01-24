//
//  RecipeDetailView.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/28/25.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe?
    var body: some View {
      detailView
    }
}

#Preview {
    RecipeDetailView()
}


extension RecipeDetailView {
    
    private var recipeImage: some View {
        Group {
            if let recipe = recipe {
                if let image = recipe.photoUrlLarge {
                    RecipeImage(imageUrlPath: image, imageName: recipe.name, largeImage: true)
                }
            }
        }
    }
    
    private var recipeName: some View {
        Group {
            if let recipe = recipe {
                    RecipeName(recipeName: recipe.name, detailView: true)
            }
        }
    }
    
    private var cuisineType: some View {
        Group {
            if let recipe = recipe {
                    CuisineType(recipeCuisine: recipe.cuisine, detailView: true)
            }
        }
    }
    
    private var detailView: some View {
        VStack(alignment: .leading, spacing: 10) {
            recipeImage
            recipeName
            cuisineType
            Spacer()
        }
        .padding()
    }
    
}
