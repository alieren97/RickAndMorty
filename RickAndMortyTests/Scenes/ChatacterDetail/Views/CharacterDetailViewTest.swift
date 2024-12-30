//
//  CharacterDetailViewTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class CharacterDetailViewTest: XCTestCase {

    private var sut: CharacterDetailView!
    private let mockData: RMCharacter = MockCharacterDataFactory.rickCharacter

    override func setUp() {
        super.setUp()

        sut = CharacterDetailView()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfNameMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.nameLabel.text, "Name: \(mockData.name)")
    }

    func test_ConfigureFunction_IfStatusMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.statusLabel.text, "Status: \(mockData.status.rawValue)")
    }

    func test_ConfigureFunction_IfSpeciesMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.speciesLabel.text, "Species: \(mockData.species)")
    }

    func test_ConfigureFunction_IfGenderMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.genderLabel.text, "Gender: \(mockData.gender)")
    }
}
