//
//  EpisodeDetailViewTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class EpisodeDetailViewTest: XCTestCase {

    private var sut: EpisodeDetailView!
    private var delegate: MockEpisodeDetailViewDelegate!
    private let mockData: RMEpisode = MockCharacterDataFactory.episode1

    override func setUp() {
        super.setUp()

        sut = EpisodeDetailView()

        delegate = MockEpisodeDetailViewDelegate()
        sut.delegate = delegate
    }

    override func tearDown() {

        sut = nil
        delegate = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfNameMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.nameLabel.text, "Name: \(mockData.name)")
    }

    func test_ConfigureFunction_IfAirDateMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.airDateLabel.text, "Air Date: \(mockData.airDate)")
    }

    func test_ConfigureFunction_IfEpisodeMatched() {

        sut.configure(with: mockData)

        XCTAssertEqual(sut.episodeCodeLabel.text, "Episode: \(mockData.episode)")
    }

    func test_ShowCharacterList() {

        sut.showCharacterList(with: MockCharacterDataFactory.characterList)

        let numberOfItems = sut.collectionView.numberOfItems(inSection: 0)

        XCTAssertEqual(numberOfItems, MockCharacterDataFactory.characterList.count)
    }

    func testCellForItemAtIndexPath() {

        sut.showCharacterList(with: MockCharacterDataFactory.characterList)

        let indexPath = IndexPath(item: 0, section: 0)
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: indexPath)

        XCTAssertNotNil(cell)
    }

    func testDidSelectItemAtIndexPath() {

        sut.showCharacterList(with: MockCharacterDataFactory.characterList)
        let indexPath = IndexPath(item: 1, section: 0)
        let selectedId = MockCharacterDataFactory.characterList[indexPath.item].id

        sut.collectionView.delegate?.collectionView?(sut.collectionView, didSelectItemAt: indexPath)

        XCTAssertTrue(delegate.isCharacterSelected!)
        XCTAssertEqual(delegate.selectedCharacterId!, selectedId)
    }
}

private class MockEpisodeDetailViewDelegate: EpisodeDetailViewDelegate {
    var isCharacterSelected: Bool?
    var selectedCharacterId: Int?

    func selectCharacter(characterId: Int) {
        isCharacterSelected = true
        selectedCharacterId = characterId
    }

}
