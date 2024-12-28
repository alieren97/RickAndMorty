//
//  NetworkError.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

public enum NetworkError: Error {
    case decodingError
    case apiError(String)
}
