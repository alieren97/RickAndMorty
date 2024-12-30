//
//  TabBarCoordinatorFactoryTests.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class TabBarCoordinatorFactoryTests: XCTestCase {

    func testMakeTabBarNavigation() {
        // Given: We call the factory method to create a TabBarCoordinator instance
        let coordinator = TabBarCoordinatorFactory.makeTabBarNavigation()

        // Then: Verify that the returned coordinator is of type TabBarCoordinatorImpl
        XCTAssertTrue(coordinator is TabBarCoordinatorImpl, "The coordinator should be of type TabBarCoordinatorImpl")

        // Optionally, you can also check if it is properly initialized
        XCTAssertNotNil(coordinator, "The coordinator should not be nil")
    }
}
