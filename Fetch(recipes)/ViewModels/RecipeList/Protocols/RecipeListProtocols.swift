//
//  RecipeListProtocols.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/28/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
protocol RecipeListProtocol {
    var recipes: [Recipe] { get set }
    func fetchRecipes() async
}
