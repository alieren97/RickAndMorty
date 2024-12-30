//
//  CharacterDetailBuilderTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class CharacterDetailBuilderTest: XCTestCase {

    func testMakeViewController() {
        // Act
        let mockId = 1
        let viewController = CharacterDetailBuilder.make(characterId: mockId)

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is CharacterDetailViewController)

        XCTAssertNotNil(viewController.viewModel)
        XCTAssertTrue(viewController.viewModel is CharacterDetailViewModelImpl)

        let viewModel = viewController.viewModel as? CharacterDetailViewModelImpl
        XCTAssertNotNil(viewModel?.service)

        XCTAssertEqual(viewModel?.characterId, mockId)

        XCTAssertTrue(viewModel?.service is CharacterDetailServiceImpl)
    }
}
