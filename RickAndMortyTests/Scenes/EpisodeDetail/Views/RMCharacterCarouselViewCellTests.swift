//
//  RMCharacterCarouselViewCellTests.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
import Kingfisher
@testable import RickAndMorty

final class RMCharacterCarouselViewCellTests: XCTestCase {

    private var sut: RMCharacterCarouselViewCell!
    private let mockData: RMCharacter = MockCharacterDataFactory.rickCharacter

    override func setUp() {
        super.setUp()

        sut = RMCharacterCarouselViewCell()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func testConfigureWithValidCharacter() {
           // Arrange
           let character = mockData

           // Create an expectation to wait for the image to load
           let expectation = self.expectation(description: "Image should be set")

           // Act
           sut.configure(with: mockData)

           // Wait for the asynchronous call to finish (simulating the image load completion)
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               // Assert: Check if the imageView's image is not nil after the valid URL is set
               XCTAssertNotNil(self.sut.characterImageView.image, "Image should be set for valid URL")
               expectation.fulfill() // Fulfill the expectation when the image is set
           }

           // Wait for the expectation to be fulfilled
           wait(for: [expectation], timeout: 3)
       }

       func testConfigureWithInvalidCharacterImage() {
           // Arrange
           let character = MockCharacterDataFactory.invalidImageRickSanchezData

           // Act
           sut.configure(with: character)

           // Assert: Check if the imageView's image is nil for an invalid URL
           XCTAssertNil(sut.characterImageView.image, "Image should be nil for invalid URL")
       }
}
