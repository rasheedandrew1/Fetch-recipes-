//
//  RecipeListView.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/26/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject private var vm: RecipeViewModel = RecipeViewModel()
    var body: some View {
        NavigationStack {
            populatedView
              .navigationTitle("Recipes")
              .navigationBarTitleDisplayMode(.automatic)
              .navigationBarItems(trailing: HStack{
                  refreshButton
                    })
            
        }
    }
}

#Preview {
    RecipeListView()
}


extension RecipeListView {
    private var populatedView: some View {
        Group {
            if vm.recipes.count < 1 {
                emptyRecipeView
            } else {
                populatedList
            }
        } .task {
            await vm.fetchRecipes()
        }
    }
    
    private var populatedList: some View {
        List {
            ForEach(vm.recipes, id: \.self) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                RecipeCellView(recipe: recipe)}
            }
        }.listStyle(PlainListStyle())
    }
    
    private var emptyRecipeView: some View {
        VStack(spacing: 10) {
           Spacer()
            Image(systemName: "list.dash")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            Text("No recipes at the moment!")
                .font(.headline)
                .foregroundColor(.gray)
           Spacer()
        }
    }
    
    private var refreshButton: some View {
        Image(systemName: "arrow.clockwise")
            .onTapGesture {
                vm.recipes.removeAll()
                Task {
                    await vm.fetchRecipes()
                }
            }
    }
}
