//
//  RMLocationTableViewCellTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class RMLocationTableViewCellTest: XCTestCase {

    private var sut: RMLocationTableViewCell!
    private let mockData: RMLocation = MockCharacterDataFactory.locationEarth

    override func setUp() {
        super.setUp()

        sut = RMLocationTableViewCell()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfLocationNameTitleMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.nameLabel.text, mockData.name)
    }

    func test_ConfigureFunction_IfLocationTypeTitleMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.typeLabel.text, "Type: \(mockData.type)")
    }

    func test_ConfigureFunction_IfLocationDimensionTitleMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.dimensionLabel.text, "Dimension: \(mockData.dimension)")
    }
}
