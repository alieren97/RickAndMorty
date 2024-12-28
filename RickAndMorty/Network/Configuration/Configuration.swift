//
//  Configuration.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

final class Configuration: ConfigurationProtocol {
    static var baseURL: String {
        let url: String? = try? self.value(for: "BASE_URL")
        return url ?? ""
    }
}
