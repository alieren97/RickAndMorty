//
//  HomeBuilderTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class HomeBuilderTest: XCTestCase {

    func testMakeViewController() {
        // Act
        let viewController = HomeBuilder.make()

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is HomeViewController)

        XCTAssertNotNil(viewController.viewModel)
        XCTAssertTrue(viewController.viewModel is HomeViewModelImpl)

        let viewModel = viewController.viewModel as? HomeViewModelImpl
        XCTAssertNotNil(viewModel?.service)

        XCTAssertTrue(viewModel?.service is HomeViewServiceImpl)
    }
}
