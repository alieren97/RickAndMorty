//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case decodingError
    case apiError(String)
    case requestFailed
}
