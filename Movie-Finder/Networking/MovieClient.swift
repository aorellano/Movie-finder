//
//  MovieClient.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/16/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieClient: APIClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getGenres(from type: MovieRecommendation, completion: @escaping (Result<GenreList, APIError>) -> Void) {
        let request = type.request
        
        fetch(with: request, decode: { json -> GenreList? in
            guard let genreList = json as? GenreList else { return nil }
            return genreList
        }, completion: completion)
    }
    
    func getSubgenres(from type: MovieRecommendation, completion: @escaping (Result<SubgenreList, APIError>) -> Void) {
        let request = type.request
        
        fetch(with: request, decode: { json -> SubgenreList? in
            guard let genreList = json as? SubgenreList else { return nil }
            return genreList
        }, completion: completion)
    }
    
    func recommendMovies(from type: MovieRecommendation, completion: @escaping (Result<MovieList, APIError>) -> Void) {
        let request = type.request
        
        fetch(with: request, decode: { json -> MovieList? in
            guard let movieList = json as? MovieList else { return nil }
            return movieList
        }, completion: completion)
    }
    
    func getCast(from type: MovieRecommendation, completion: @escaping (Result<CastList, APIError>) -> Void) {
        let request = type.request
        
        fetch(with: request, decode: { json -> CastList? in
            guard let castList = json as? CastList else { return nil }
            return castList
        }, completion: completion)
    }
    
    func getVideo(from type: MovieRecommendation, completion: @escaping (Result<VideoList, APIError>) -> Void) {
        let request = type.request
        
        fetch(with: request, decode: { json -> VideoList? in
            guard let videoList = json as? VideoList else { return nil }
            return videoList
            
        }, completion: completion)
    }
}
