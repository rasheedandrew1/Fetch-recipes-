//
//  ImageManager_test.swift
//  Fetch(recipes)Tests
//
//  Created by Rasheed on 1/29/25.
//

import XCTest
@testable import Fetch_recipes_

//Naming structure: test_[struct or class]_[variable or function]_[expected result]
//Testing Structure: Given, When, Then

@MainActor
final class ImageManager_test: XCTestCase {

    var viewModel : ImageManager?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ImageManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    @MainActor func test_ImageManager_downloadImage_shouldReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        let invalidUrl = ""
        //When
        do {
        _ = try await vm.downloadImage(url: invalidUrl)
            //Then
        XCTFail("Expected to throw an error, but it didn't.")
        } catch let error as ImageDownloadError {
        XCTAssertEqual(error, ImageDownloadError.invalidURL, "Expected invalidURL error.")
        } catch {
        XCTFail("Expected an ImageDownloadError, but got \(error).")
        }
    }
    
    @MainActor func test_ImageManager_downloadImage_shouldNotReturnNil() async throws {
        //Given
        guard let vm = viewModel else { return }
        //When
        let result = try await vm.downloadImage(url: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")
        //Then
        XCTAssertNotNil(result)
    }

    
    @MainActor func test_ImageManager_cacheFetchedImage_shouldEqualResultFromGetImageFromCache() async  {
        //Given
        guard let vm = viewModel else { return }
        let image: NSData = NSData()
        let name: String = "test"
        //When
        vm.cacheFetchedImage(image: image, name: name)
        //Then
        if let cachedImage = vm.getImageFromCache(imageName: name) {
        XCTAssertEqual(cachedImage, image, "The cached image should be the same as the one stored.")
        } else {
        XCTFail("Image should be retrieved from cache, but it is nil.")
        }
    }
}



