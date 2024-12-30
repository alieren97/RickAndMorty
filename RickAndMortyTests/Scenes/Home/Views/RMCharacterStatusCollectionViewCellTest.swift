//
//  RMCharacterStatusCollectionViewCellTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class RMCharacterStatusCollectionViewCellTest: XCTestCase {

    private var sut: RMCharacterStatusCollectionViewCell!
    private let mockStatus: RMStatusEnum = .alive

    override func setUp() {
        super.setUp()

        sut = RMCharacterStatusCollectionViewCell()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfEpisodeNameTitleMatched() {

        sut.configure(with: mockStatus, isSelected: false)

        XCTAssertEqual(sut.statusTitleLabel.text, mockStatus.rawValue)
    }

    func test_ConfigureFunction_IfSelected_CheckBackground() {

        sut.configure(with: mockStatus, isSelected: true)

        XCTAssertEqual(sut.contentView.backgroundColor, mockStatus.backgroundColor)
    }

    func test_ConfigureFunction_If_NotSelected_CheckBackground() {

        sut.configure(with: mockStatus, isSelected: false)

        XCTAssertEqual(sut.contentView.backgroundColor, .clear)
    }
}
