//
//  RMStatusEnum.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

enum RMStatusEnum: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = RMStatusEnum(rawValue: rawValue) ?? .unknown
    }
}
