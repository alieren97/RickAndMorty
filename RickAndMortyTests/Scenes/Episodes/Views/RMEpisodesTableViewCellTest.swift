//
//  RMEpisodesTableViewCellTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class RMEpisodesTableViewCellTest: XCTestCase {

    private var sut: RMEpisodesTableViewCell!
    private let mockData: RMEpisode = MockCharacterDataFactory.episode1

    override func setUp() {
        super.setUp()

        sut = RMEpisodesTableViewCell()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfEpisodeNameTitleMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.episodeNameLabel.text, mockData.name)
    }

    func test_ConfigureFunction_IfEpisodeCodeTitleMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.episodeCodeLabel.text, mockData.episode)
    }

    func test_ConfigureFunction_IfAirLabelTitleMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.airDateLabel.text, "Air Date: \(mockData.airDate)")
    }
}

