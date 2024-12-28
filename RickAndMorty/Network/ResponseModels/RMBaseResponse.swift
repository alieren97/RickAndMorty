//
//  RMBaseResponse.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

// MARK: - BaseResponse
struct RMBaseResponse<T: Codable>: Codable {
    let info: RMInfo
    let results: [T]
}

// MARK: - Info
struct RMInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
