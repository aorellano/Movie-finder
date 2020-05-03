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
    
    func getGenres(from type: Movie, completion: @escaping (Result<GenreList, APIError>) -> Void) {
        
        let request = type.request
        print(request)
        
        fetch(with: request, decode: { json -> GenreList? in
            guard let genreList = json as? GenreList else { return nil }
            print(genreList)
            return genreList
        }, completion: completion)
    }
    
    func getSubgenres(from type: Movie, completion: @escaping (Result<SubgenreList, APIError>) -> Void) {
        
        let request = type.request
        print(request)
        
        fetch(with: request, decode: { json -> SubgenreList? in
            guard let genreList = json as? SubgenreList else { return nil }
            print(genreList)
            return genreList
        }, completion: completion)
    }
    
    
}
