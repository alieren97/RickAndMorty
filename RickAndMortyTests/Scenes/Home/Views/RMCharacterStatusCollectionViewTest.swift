//
//  RMCharacterStatusCollectionViewTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class RMCharacterStatusCollectionViewTest: XCTestCase {

    private var sut: RMCharacterStatusCollectionView!
    private var delegate: MockRMCharacterStatusCollectionViewDelegate!
    private let mockStatus: RMStatusEnum = .alive

    override func setUp() {
        super.setUp()

        sut = RMCharacterStatusCollectionView()

        delegate = MockRMCharacterStatusCollectionViewDelegate()
        sut.delegate = delegate
    }

    override func tearDown() {

        sut = nil
        delegate = nil
        super.tearDown()
    }

    func testCollectionViewNumberOfItems() {

         let numberOfItems = sut.collectionView(sut.collectionView, numberOfItemsInSection: 0)

         XCTAssertEqual(numberOfItems, RMStatusEnum.allCases.count, "The number of items should match the count of RMStatusEnum.allCases.")
     }

    func testCellForItemAtIndexPath() {

         sut.collectionView.reloadData()
         let indexPath = IndexPath(item: 0, section: 0)
         let cell = sut.collectionView(sut.collectionView, cellForItemAt: indexPath)


         XCTAssertTrue(cell is RMCharacterStatusCollectionViewCell)
         guard let statusCell = cell as? RMCharacterStatusCollectionViewCell else { return }
         let expectedStatus = RMStatusEnum.allCases[indexPath.item]
         XCTAssertEqual(statusCell.getStatus(), expectedStatus)
     }

    func testDidSelectItemNotifiesDelegate() {

        let indexPath = IndexPath(item: 1, section: 0)

        sut.collectionView(sut.collectionView, didSelectItemAt: indexPath)

        XCTAssertEqual(delegate.selectedStatus, RMStatusEnum.allCases[indexPath.item], "The delegate should be notified with the correct selected status.")
    }

}

private class MockRMCharacterStatusCollectionViewDelegate: RMCharacterStatusCollectionViewDelegate {
    var isStatuSelected: Bool?
    var selectedStatus: RMStatusEnum?

    func selectStatus(with status: RickAndMorty.RMStatusEnum) {
        isStatuSelected = true
        selectedStatus = status
    }
    

}
