//
//  MyMovieFunctions.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/13/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import Foundation

class MovieListManager {
    static func createWatchMovie(_ movie: SavedMovie) {
        MyMovieList.watchMovies.append(movie)
    }
    
    static func readWatchMovies() {
        
    }
    
    static func updateWatchMovie(_ movie: Movie) {
        
    }
    
    static func deleteWatchMovie(at index: Int) {
        MyMovieList.watchMovies.remove(at: index)
    }
    
    static func createSeenMovie(_ movie: SavedMovie) {
            MyMovieList.seenMovies.append(movie)
    }
        
    static func readSeenMovies(completion: @escaping () -> ()) {
        
    }
        
    static func updateSeenMovie(_ movie: Movie) {
            
    }
        
    static func deleteSeenMovie(at index: Int) {
        MyMovieList.seenMovies.remove(at: index)
    }
    
}
