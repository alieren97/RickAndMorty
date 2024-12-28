//
//  NetworkService.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation
import Alamofire

public final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()

    func request<T>(type: T.Type, route: APIRouter, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        AF.request(route).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure(let error):
                completion(.failure(.apiError(error.localizedDescription)))
            }
        }
    }
}
