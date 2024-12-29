//
//  APIRouter.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {

    case getCharacters
    case getCharacter(String)
    case getEpisodes
    case getEpisode(String)
    case getLocations

    private var baseURL: String {
        return Configuration.baseURL
    }

    private var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        case .getCharacter(let characterId):
            return "/character/\(characterId)"
        case .getEpisodes:
            return "/episode"
        case .getEpisode(let episodeId):
            return "/episode/\(episodeId)"
        case .getLocations:
            return "/location"
        }
    }

    private var method: HTTPMethod {
        switch self {
        case .getCharacters, .getCharacter(_), .getEpisodes, .getEpisode(_), .getLocations:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        return request
    }

}

