//
//  RecipeViewModel.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/26/25.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject, RecipeListProtocol {
    @Published var recipes: [Recipe] = []
    @Published var url: URL? = constants().allRecipes
    
    
    func fetchRecipes() async {
        guard let url = url else {
               return }
           do {
               let (data, _) = try await URLSession.shared.data(from: url)
               let decoder = JSONDecoder()
               let decodedResponse = try decoder.decode([String: [Recipe]].self, from: data)
               self.recipes = decodedResponse["recipes"] ?? []
           } catch {
               print("Failed to fetch or decode data: \(error)")
           }
       }
}



struct constants {
    let allRecipes = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
    let alformedData = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
    let emptyData = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
    let badURL = URL(string: "bad url")!
}



