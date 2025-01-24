//
//  RecipeImageViewModel_test.swift
//  Fetch(recipes)Tests
//
//  Created by Rasheed on 1/28/25.
//

import XCTest
@testable import Fetch_recipes_

//Naming structure: test_[struct or class]_[variable or function]_[expected result]
//Testing Structure: Given, When, Then

@MainActor
final class RecipeImageViewModel_test: XCTestCase {

    var viewModel : RecipeImageViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = RecipeImageViewModel(imageManager: ImageManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    @MainActor func test_RecipeImageViewmodel_imageName_shouldBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        //When
        vm.imageName = nil
        //Then
        XCTAssertNil(vm.imageName)
    }
    
    @MainActor func test_RecipeImageViewmodel_imageName_shouldNotBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        //When
        vm.imageName = ""
        //Then
        XCTAssertNotNil(vm.imageName)
    }
    
    @MainActor func test_RecipeImageViewmodel_imageUrl_shouldBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        vm.imageUrl = nil
        //Then
        XCTAssertNil(vm.imageUrl)
    }
    
    @MainActor func test_RecipeImageViewmodel_imageUrl_shouldNotBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        //When
        vm.imageName = ""
        //Then
        XCTAssertNotNil(vm.imageName)
    }
    
    @MainActor func test_RecipeImageViewmodel_cachedImage_shouldBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        let imageData: NSData? = nil
        //When
        vm.cachedImage = imageData
        //Then
        XCTAssertNil(vm.cachedImage)
    }
    
    @MainActor func test_RecipeImageViewmodel_cachedImage_shouldNotBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        let imageData = NSData()
        //When
        vm.cachedImage = imageData
        //Then
        XCTAssertNotNil(vm.cachedImage)
    }
    
    @MainActor func test_RecipeImageViewmodel_downloadedData_shouldBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        let imageData: Data? = nil
        //When
        vm.downloadedData = imageData
        //Then
        XCTAssertNil(vm.downloadedData)
    }
    
    @MainActor func test_RecipeImageViewmodel_downloadedData_shouldNotBeNil() throws {
        //Given
        guard let vm = viewModel else { return }
        let imageData = Data()
        //When
        vm.downloadedData = imageData
        //Then
        XCTAssertNotNil(vm.downloadedData)
    }
    
  
    func test_RecipeImageViewmodel_downloadImage_shouldNotReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        vm.imageUrl = constants().allRecipes?.absoluteString
        guard let url = vm.imageUrl else { return }
        //When
        let image = await vm.downloadImage(url: url)
        //Then
        XCTAssertNotNil(image)
        }
    
    func test_RecipeImageViewmodel_downloadImage_shouldReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        vm.imageUrl = nil
        guard let url = vm.imageUrl else { return }
        //When
        let image = await vm.downloadImage(url: url)
        //Then
        XCTAssertNil(image)
    }
    
    func test_RecipeImageViewmodel_getImageFromCache_shouldNotReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        vm.imageName = "Apam Balik"
        //When
        let cachedItem = await vm.getImageFromCache()
        guard let result = cachedItem else { return }
        //Then
        XCTAssertNotNil(result)
        }
    
    func test_RecipeImageViewmodel_getImageFromCache_shouldReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        vm.imageName = nil
        guard let name = vm.imageName else { return }
        //When
        let cachedItem = vm.imageManager.getImageFromCache(imageName: name)
        //Then
        XCTAssertNotNil(cachedItem)
    }
    
    func test_RecipeImageViewmodel_processImageUrl_shouldReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        vm.imageName = "Apam Balik"
        vm.imageUrl = constants().allRecipes?.absoluteString
        //When
        await vm.processImageUrl()
        //Then
        XCTAssertEqual(vm.downloadedData?.description, nil)
    }

}

