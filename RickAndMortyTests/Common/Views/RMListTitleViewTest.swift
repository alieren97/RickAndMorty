//
//  RMListTitleViewTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class RMListTitleViewTest: XCTestCase {

    private var sut: RMListTitleView!

    override func setUp() {
        super.setUp()

        sut = RMListTitleView()
    }

    override func tearDown() {

        sut = nil
        super.tearDown()
    }

    func test_ConfigureFunction_IfTitleMatched() {
        let testTitle = "Test"

        sut.configure(title: testTitle)

        XCTAssertEqual(sut.titleLabel.text, testTitle)
    }
}
