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
    case discover(page: String, genre: String, sortedBy: String)
    case nowPlaying
    case upcoming
    case cast(movieId: String)
    case popular
    case topRated
    case search(movie: String)
    case video(movieId: String)
    case similar(movieId: String)
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
            case .nowPlaying: return "/movie/now_playing"
            case .upcoming: return "movie/upcoming"
            case .cast(let movieId): return "/movie/\(movieId)/credits"
            case .popular: return "/movie/popular"
            case .topRated: return "/movie/top_rated"
            case .search: return "/search/movie"
            case .video(let movieId): return "/movie/\(movieId)/videos"
            case .similar(let movieId): return "/movie/\(movieId)/similar"
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
        case .discover(let page, let genre, let sortedBy):
            return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "page", value: page),
                URLQueryItem(name: "with_genres", value: genre),
                URLQueryItem(name: "sort_by", value: sortedBy),
                URLQueryItem(name: "with_original_language", value: "en"),
                URLQueryItem(name: "region", value: "US")
            ]
        case .nowPlaying: return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "region", value: "US")
            ]
        case .upcoming: return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "region", value: "US")
            ]
        case .cast(let movieId):
            return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "movie_Id", value: String(movieId))
            ]
        case .popular: return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "region", value: "US")
            ]
        case .topRated: return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "region", value: "US")
            ]
        case .search(let movie): return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "region", value: "US"),
                URLQueryItem(name: "query", value: movie)
            ]
        case .video(let movieId): return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "movie_Id", value: String(movieId))
            ]
        case .similar(let movieId): return [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "movie_Id", value: String(movieId))
            ]
        }
    }
}
