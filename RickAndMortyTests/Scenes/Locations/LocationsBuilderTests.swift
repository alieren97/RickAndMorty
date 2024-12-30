//
//  LocationsBuilderTests.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class LocationsBuilderTests: XCTestCase {

    func testMakeViewController() {
        // Act
        let viewController = LocationsBuilder.make()

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is LocationsViewController)

        XCTAssertNotNil(viewController.viewModel)
        XCTAssertTrue(viewController.viewModel is LocationsViewModelImpl)

        let viewModel = viewController.viewModel as? LocationsViewModelImpl
        XCTAssertNotNil(viewModel?.service)

        XCTAssertTrue(viewModel?.service is LocationsViewServiceImpl)
    }

}
