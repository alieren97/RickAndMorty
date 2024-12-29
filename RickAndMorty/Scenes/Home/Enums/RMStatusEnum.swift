//
//  RMStatusEnum.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

enum RMStatusEnum: String, CaseIterable, Codable {
    case all = "All"
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = RMStatusEnum(rawValue: rawValue) ?? .unknown
    }

    var backgroundColor: UIColor {
        switch self {
        case .all:
            return .lightGray
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .orange
        }
    }
}
