//
//  Endpoint.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/10/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

protocol Endpoint {
    var base: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var apiKey: String {
        return "25d3b3b13927672472060f6f5971a50f"
    }
    
    var urlComponents: URLComponents {
        let baseUrl = base.appendingPathComponent(path)
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum Movie {
    case genre
    case subGenre(term: String, page: String)
}

extension Movie: Endpoint {
    var base: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
            case .genre: return "/genre/movie/list"
            case .subGenre: return "/search/keyword"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .genre: return [
                URLQueryItem(name: "api_key", value: apiKey)
            ]
        case .subGenre(let term, let page):
            return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "query", value: term),
                URLQueryItem(name: "page", value: page)
            ]
        }
    }
}
