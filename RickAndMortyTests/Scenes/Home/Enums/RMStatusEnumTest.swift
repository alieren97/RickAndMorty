//
//  RMStatusEnumTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

class RMStatusEnumTests: XCTestCase {

    func testInitializationFromRawValue() {
        // Valid cases
        XCTAssertEqual(RMStatusEnum(rawValue: "All"), .all)
        XCTAssertEqual(RMStatusEnum(rawValue: "Alive"), .alive)
        XCTAssertEqual(RMStatusEnum(rawValue: "Dead"), .dead)
        XCTAssertEqual(RMStatusEnum(rawValue: "Unknown"), .unknown)
    }

    func testBackgroundColorMapping() {
        XCTAssertEqual(RMStatusEnum.all.backgroundColor, UIColor.lightGray)
        XCTAssertEqual(RMStatusEnum.alive.backgroundColor, UIColor.green)
        XCTAssertEqual(RMStatusEnum.dead.backgroundColor, UIColor.red)
        XCTAssertEqual(RMStatusEnum.unknown.backgroundColor, UIColor.orange)
    }

    func testDecodingFromJSON() throws {
        let decoder = JSONDecoder()

        // Valid JSON
        let validJSON = "\"Alive\"".data(using: .utf8)!
        let decodedEnum = try decoder.decode(RMStatusEnum.self, from: validJSON)
        XCTAssertEqual(decodedEnum, .alive)

        // Invalid JSON
        let invalidJSON = "\"Nonexistent\"".data(using: .utf8)!
        let decodedInvalidEnum = try decoder.decode(RMStatusEnum.self, from: invalidJSON)
        XCTAssertEqual(decodedInvalidEnum, .unknown)

        // Empty JSON
        let emptyJSON = "\"\"".data(using: .utf8)!
        let decodedEmptyEnum = try decoder.decode(RMStatusEnum.self, from: emptyJSON)
        XCTAssertEqual(decodedEmptyEnum, .unknown)
    }
}
