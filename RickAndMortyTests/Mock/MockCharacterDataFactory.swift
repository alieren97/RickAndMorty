//
//  MockCharacterData.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation
@testable import RickAndMorty

final class MockCharacterDataFactory {
    static let characterList: [RMCharacter] = [MockCharacterData.rickSanchezData, MockCharacterData.mortyMockCharacter]
    static let rickCharacter: RMCharacter = MockCharacterData.rickSanchezData
    static let invalidImageRickSanchezData: RMCharacter = MockCharacterData.invalidImageRickSanchezData

    static let episodeList: [RMEpisode] = [MockCharacterData.episode1Data]
    static let episode1: RMEpisode = MockCharacterData.episode1Data

    static let locationList: [RMLocation] = [MockCharacterData.locationMockData]
    static let locationEarth: RMLocation = MockCharacterData.locationMockData
}

private class MockCharacterData {
    static let rickSanchezData = RMCharacter(id: 1,
                                             name: "Rick Sanchez",
                                             status: "Alive",
                                             species: "Human",
                                             type: "",
                                             gender: "Male",
                                             origin: RMCharacterLocation(name: "Earth (C-137)",
                                                                         url: "https://rickandmortyapi.com/api/location/1"),
                                             location: RMCharacterLocation(name: "Citadel of Ricks",
                                                                           url: "https://rickandmortyapi.com/api/location/3"),
                                             image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                             episode: [
                                                "https://rickandmortyapi.com/api/episode/1",
                                                "https://rickandmortyapi.com/api/episode/2",
                                                "https://rickandmortyapi.com/api/episode/3",
                                                "https://rickandmortyapi.com/api/episode/4",
                                                "https://rickandmortyapi.com/api/episode/5",
                                                "https://rickandmortyapi.com/api/episode/6",
                                                "https://rickandmortyapi.com/api/episode/7",
                                                "https://rickandmortyapi.com/api/episode/8",
                                                "https://rickandmortyapi.com/api/episode/9",
                                                "https://rickandmortyapi.com/api/episode/10",
                                                "https://rickandmortyapi.com/api/episode/11",
                                                "https://rickandmortyapi.com/api/episode/12",
                                                "https://rickandmortyapi.com/api/episode/13",
                                                "https://rickandmortyapi.com/api/episode/14",
                                                "https://rickandmortyapi.com/api/episode/15",
                                                "https://rickandmortyapi.com/api/episode/16",
                                                "https://rickandmortyapi.com/api/episode/17",
                                                "https://rickandmortyapi.com/api/episode/18",
                                                "https://rickandmortyapi.com/api/episode/19",
                                                "https://rickandmortyapi.com/api/episode/20",
                                                "https://rickandmortyapi.com/api/episode/21",
                                                "https://rickandmortyapi.com/api/episode/22",
                                                "https://rickandmortyapi.com/api/episode/23",
                                                "https://rickandmortyapi.com/api/episode/24",
                                                "https://rickandmortyapi.com/api/episode/25",
                                                "https://rickandmortyapi.com/api/episode/26",
                                                "https://rickandmortyapi.com/api/episode/27",
                                                "https://rickandmortyapi.com/api/episode/28",
                                                "https://rickandmortyapi.com/api/episode/29",
                                                "https://rickandmortyapi.com/api/episode/30",
                                                "https://rickandmortyapi.com/api/episode/31",
                                                "https://rickandmortyapi.com/api/episode/32",
                                                "https://rickandmortyapi.com/api/episode/33",
                                                "https://rickandmortyapi.com/api/episode/34",
                                                "https://rickandmortyapi.com/api/episode/35",
                                                "https://rickandmortyapi.com/api/episode/36",
                                                "https://rickandmortyapi.com/api/episode/37",
                                                "https://rickandmortyapi.com/api/episode/38",
                                                "https://rickandmortyapi.com/api/episode/39",
                                                "https://rickandmortyapi.com/api/episode/40",
                                                "https://rickandmortyapi.com/api/episode/41",
                                                "https://rickandmortyapi.com/api/episode/42",
                                                "https://rickandmortyapi.com/api/episode/43",
                                                "https://rickandmortyapi.com/api/episode/44",
                                                "https://rickandmortyapi.com/api/episode/45",
                                                "https://rickandmortyapi.com/api/episode/46",
                                                "https://rickandmortyapi.com/api/episode/47",
                                                "https://rickandmortyapi.com/api/episode/48",
                                                "https://rickandmortyapi.com/api/episode/49",
                                                "https://rickandmortyapi.com/api/episode/50",
                                                "https://rickandmortyapi.com/api/episode/51"
                                             ],
                                             url: "https://rickandmortyapi.com/api/character/1",
                                             created: "2017-11-04T18:48:46.250Z")

    static let invalidImageRickSanchezData = RMCharacter(id: 1,
                                             name: "Rick Sanchez",
                                             status: "Alive",
                                             species: "Human",
                                             type: "",
                                             gender: "Male",
                                             origin: RMCharacterLocation(name: "Earth (C-137)",
                                                                         url: "https://rickandmortyapi.com/api/location/1"),
                                             location: RMCharacterLocation(name: "Citadel of Ricks",
                                                                           url: "https://rickandmortyapi.com/api/location/3"),
                                             image: "invalid_image",
                                             episode: [
                                                "https://rickandmortyapi.com/api/episode/1",
                                                "https://rickandmortyapi.com/api/episode/2",
                                                "https://rickandmortyapi.com/api/episode/3",
                                                "https://rickandmortyapi.com/api/episode/4",
                                                "https://rickandmortyapi.com/api/episode/5",
                                                "https://rickandmortyapi.com/api/episode/6",
                                                "https://rickandmortyapi.com/api/episode/7",
                                                "https://rickandmortyapi.com/api/episode/8",
                                                "https://rickandmortyapi.com/api/episode/9",
                                                "https://rickandmortyapi.com/api/episode/10",
                                                "https://rickandmortyapi.com/api/episode/11",
                                                "https://rickandmortyapi.com/api/episode/12",
                                                "https://rickandmortyapi.com/api/episode/13",
                                                "https://rickandmortyapi.com/api/episode/14",
                                                "https://rickandmortyapi.com/api/episode/15",
                                                "https://rickandmortyapi.com/api/episode/16",
                                                "https://rickandmortyapi.com/api/episode/17",
                                                "https://rickandmortyapi.com/api/episode/18",
                                                "https://rickandmortyapi.com/api/episode/19",
                                                "https://rickandmortyapi.com/api/episode/20",
                                                "https://rickandmortyapi.com/api/episode/21",
                                                "https://rickandmortyapi.com/api/episode/22",
                                                "https://rickandmortyapi.com/api/episode/23",
                                                "https://rickandmortyapi.com/api/episode/24",
                                                "https://rickandmortyapi.com/api/episode/25",
                                                "https://rickandmortyapi.com/api/episode/26",
                                                "https://rickandmortyapi.com/api/episode/27",
                                                "https://rickandmortyapi.com/api/episode/28",
                                                "https://rickandmortyapi.com/api/episode/29",
                                                "https://rickandmortyapi.com/api/episode/30",
                                                "https://rickandmortyapi.com/api/episode/31",
                                                "https://rickandmortyapi.com/api/episode/32",
                                                "https://rickandmortyapi.com/api/episode/33",
                                                "https://rickandmortyapi.com/api/episode/34",
                                                "https://rickandmortyapi.com/api/episode/35",
                                                "https://rickandmortyapi.com/api/episode/36",
                                                "https://rickandmortyapi.com/api/episode/37",
                                                "https://rickandmortyapi.com/api/episode/38",
                                                "https://rickandmortyapi.com/api/episode/39",
                                                "https://rickandmortyapi.com/api/episode/40",
                                                "https://rickandmortyapi.com/api/episode/41",
                                                "https://rickandmortyapi.com/api/episode/42",
                                                "https://rickandmortyapi.com/api/episode/43",
                                                "https://rickandmortyapi.com/api/episode/44",
                                                "https://rickandmortyapi.com/api/episode/45",
                                                "https://rickandmortyapi.com/api/episode/46",
                                                "https://rickandmortyapi.com/api/episode/47",
                                                "https://rickandmortyapi.com/api/episode/48",
                                                "https://rickandmortyapi.com/api/episode/49",
                                                "https://rickandmortyapi.com/api/episode/50",
                                                "https://rickandmortyapi.com/api/episode/51"
                                             ],
                                             url: "https://rickandmortyapi.com/api/character/1",
                                             created: "2017-11-04T18:48:46.250Z")

    static let mortyMockCharacter = RMCharacter(
        id: 2,
        name: "Morty Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: RMCharacterLocation(name: "unknown", url: ""),
        location: RMCharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
        episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
                "https://rickandmortyapi.com/api/episode/3",
                "https://rickandmortyapi.com/api/episode/4",
                "https://rickandmortyapi.com/api/episode/5",
                "https://rickandmortyapi.com/api/episode/6",
                "https://rickandmortyapi.com/api/episode/7",
                "https://rickandmortyapi.com/api/episode/8",
                "https://rickandmortyapi.com/api/episode/9",
                "https://rickandmortyapi.com/api/episode/10",
                "https://rickandmortyapi.com/api/episode/11",
                "https://rickandmortyapi.com/api/episode/12",
                "https://rickandmortyapi.com/api/episode/13",
                "https://rickandmortyapi.com/api/episode/14",
                "https://rickandmortyapi.com/api/episode/15",
                "https://rickandmortyapi.com/api/episode/16",
                "https://rickandmortyapi.com/api/episode/17",
                "https://rickandmortyapi.com/api/episode/18",
                "https://rickandmortyapi.com/api/episode/19",
                "https://rickandmortyapi.com/api/episode/20",
                "https://rickandmortyapi.com/api/episode/21",
                "https://rickandmortyapi.com/api/episode/22",
                "https://rickandmortyapi.com/api/episode/23",
                "https://rickandmortyapi.com/api/episode/24",
                "https://rickandmortyapi.com/api/episode/25",
                "https://rickandmortyapi.com/api/episode/26",
                "https://rickandmortyapi.com/api/episode/27",
                "https://rickandmortyapi.com/api/episode/28",
                "https://rickandmortyapi.com/api/episode/29",
                "https://rickandmortyapi.com/api/episode/30",
                "https://rickandmortyapi.com/api/episode/31",
                "https://rickandmortyapi.com/api/episode/32",
                "https://rickandmortyapi.com/api/episode/33",
                "https://rickandmortyapi.com/api/episode/34",
                "https://rickandmortyapi.com/api/episode/35",
                "https://rickandmortyapi.com/api/episode/36",
                "https://rickandmortyapi.com/api/episode/37",
                "https://rickandmortyapi.com/api/episode/38",
                "https://rickandmortyapi.com/api/episode/39",
                "https://rickandmortyapi.com/api/episode/40",
                "https://rickandmortyapi.com/api/episode/41",
                "https://rickandmortyapi.com/api/episode/42",
                "https://rickandmortyapi.com/api/episode/43",
                "https://rickandmortyapi.com/api/episode/44",
                "https://rickandmortyapi.com/api/episode/45",
                "https://rickandmortyapi.com/api/episode/46",
                "https://rickandmortyapi.com/api/episode/47",
                "https://rickandmortyapi.com/api/episode/48",
                "https://rickandmortyapi.com/api/episode/49",
                "https://rickandmortyapi.com/api/episode/50",
                "https://rickandmortyapi.com/api/episode/51"
            ],
        url: "https://rickandmortyapi.com/api/character/2",
        created: "2017-11-04T18:50:21.651Z"
    )

    static let episode1Data = RMEpisode(
        id: 1,
        name: "Pilot",
        airDate: "December 2, 2013",
        episode: "S01E01",
        characters: [
            "https://rickandmortyapi.com/api/character/1", // Rick Sanchez
            "https://rickandmortyapi.com/api/character/2"  // Morty Smith
        ],
        url: "https://rickandmortyapi.com/api/episode/1",
        created: "2017-11-10T12:42:04.174Z"
    )

    static let locationMockData = RMLocation(
        id: 1,
        name: "Earth",
        type: "Planet",
        dimension: "Dimension C-137",
        residents: [
        "https://rickandmortyapi.com/api/character/1",
        "https://rickandmortyapi.com/api/character/2"
        ],
        url: "https://rickandmortyapi.com/api/location/1",
        created: "2017-11-10T12:42:04.162Z")
}
