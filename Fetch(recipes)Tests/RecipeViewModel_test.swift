//
//  RecipeViewModel_test.swift
//  Fetch(recipes)Tests
//
//  Created by Rasheed on 1/29/25.
//

import XCTest
@testable import Fetch_recipes_

//Naming structure: test_[struct or class]_[variable or function]_[expected result]
//Testing Structure: Given, When, Then

@MainActor
final class RecipeViewModel_test: XCTestCase {

    var viewModel : RecipeViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = RecipeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_RecipeViewModel_fetchRecipes_shouldFetchRecipes() async {
        // Given
        let expectation = self.expectation(description: "Fetching recipes")
        guard let vm = viewModel else { return }
        // When
        await vm.fetchRecipes()
        //Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                   XCTAssertTrue(vm.recipes.count > 0, "Recipes should be fetched")
                   expectation.fulfill()
               }

        await fulfillment(of: [expectation], timeout: 5)
       }

    func test_RecipeViewModel_fetchRecipes_shouldHandleError() async {
         // Given
        guard let vm = viewModel else { return }
        vm.url = constants().badURL
         // When:
         await vm.fetchRecipes()
         // Then:
        XCTAssertTrue(vm.recipes.isEmpty, "Recipes should be empty due to error")
     }
    
    
}

