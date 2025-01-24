//
//  CuisineType.swift
//  Fetch(recipes)
//
//  Created by Rasheed on 1/24/25.
//

import SwiftUI

struct CuisineType: View {
    var recipeCuisine: String
    var detailView: Bool
    var body: some View {
        cuisineTypeText
    }
}

#Preview {
    CuisineType(recipeCuisine: "Test", detailView: false)
}

extension CuisineType {
    private var cuisineTypeText: some View {
                Text(recipeCuisine)
                    .font(.system(size: detailView ? 20 : 10))
                    .fontWeight(detailView ? .regular : .medium)
                    .foregroundColor(.primary)
    }
}
