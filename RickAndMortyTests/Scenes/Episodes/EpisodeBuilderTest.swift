//
//  EpisodeBuilderTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class EpisodesBuilderTests: XCTestCase {

    func testMakeViewController() {
        // Act
        let viewController = EpisodesBuilder.make()

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is EpisodesViewController)

        XCTAssertNotNil(viewController.viewModel)
        XCTAssertTrue(viewController.viewModel is EpisodesViewModelImpl)

        let viewModel = viewController.viewModel as? EpisodesViewModelImpl
        XCTAssertNotNil(viewModel?.service)

        XCTAssertTrue(viewModel?.service is EpisodesViewServiceImpl)
    }
}
