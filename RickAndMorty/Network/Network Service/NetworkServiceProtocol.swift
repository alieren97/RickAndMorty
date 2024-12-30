//
//  NetworkServiceProtocol.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

protocol NetworkServiceProtocol {

    func request<T: Decodable>(type: T.Type, route: APIRouter, completion: @escaping (Result<T, NetworkError>) -> Void)
}
