//
//  RMListCollectionViewCellTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class RMListCollectionViewCellTest: XCTestCase {

    private var sut: RMListCollectionViewCell!
    private let mockData: RMCharacter = MockCharacterDataFactory.rickCharacter

    override func setUp() {
        super.setUp()

        sut = RMListCollectionViewCell()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfNameMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.nameLabel.text, mockData.name)
    }

    func test_ConfigureFunction_IfStatusMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.statusLabel.text, mockData.status)
    }
}
