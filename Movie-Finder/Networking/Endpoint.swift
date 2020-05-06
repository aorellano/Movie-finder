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

enum MovieRecommendation {
    case genre
    case subGenre(term: String, page: String)
    case discover(page: String, genre: String, subgenres: String, sortedBy: String)
}

enum ImageType {
    case poster
    case backdrop
    case castImage
    
    var path: String {
        switch self {
        case .poster:
            return "http://image.tmdb.org/t/p/w185"
        case .castImage:
            return "http://image.tmdb.org/t/p/w45"
        default:
            return "http://image.tmdb.org/t/p/w780"
        }
    }
}

extension MovieRecommendation: Endpoint {
    var base: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
            case .genre: return "/genre/movie/list"
            case .subGenre: return "/search/keyword"
            case .discover: return "/discover/movie"
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
        case .discover(let page, let genre, let subgenres, let sortedBy):
            return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "page", value: page),
                URLQueryItem(name: "with_genres", value: genre),
                URLQueryItem(name: "with_keywords", value: subgenres),
                URLQueryItem(name: "sort_by", value: sortedBy)
            ]
        }
        

    }
}
