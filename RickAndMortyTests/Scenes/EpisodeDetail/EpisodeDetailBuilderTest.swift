//
//  EpisodeDetailBuilderTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class EpisodeDetailBuilderTest: XCTestCase {

    func testMakeViewController() {
        // Act
        let mockId = 1
        let viewController = EpisodeDetailBuilder.make(episodeId: mockId)

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is EpisodeDetailViewController)

        XCTAssertNotNil(viewController.viewModel)
        XCTAssertTrue(viewController.viewModel is EpisodeDetailViewModelImpl)

        let viewModel = viewController.viewModel as? EpisodeDetailViewModelImpl
        XCTAssertNotNil(viewModel?.service)

        XCTAssertEqual(viewModel?.episodeId, mockId)

        XCTAssertTrue(viewModel?.service is EpisodeDetailServiceImpl)
        XCTAssertTrue(viewModel?.characterDetailService is CharacterDetailServiceImpl)
    }
}
