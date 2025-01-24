//
//  RecipeName.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//

import SwiftUI

struct RecipeName: View {
    var recipeName: String
    var detailView: Bool
    var body: some View {
        recipeNameText
    }
}

#Preview {
    RecipeName(recipeName: "Test", detailView: false)
}


extension RecipeName {
    
    private var recipeNameText: some View {
                Text(recipeName)
                    .font(.system(size: detailView ? 20 : 10))
                    .fontWeight(detailView ? .bold : .medium)
                    .foregroundColor(.primary)
    }
    
}
