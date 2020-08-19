//
//  MyMovieFunctions.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/13/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import Foundation

class MovieListFunctions {
    static func createWatchMovie(_ movie: Movie) {
        MyMovieList.watchMovies.append(movie)
        
    }
    
    static func readWatchMovies() {
        
    }
    
    static func updateWatchMovie(_ movie: Movie) {
        
    }
    
    static func deleteWatchMovie(at index: Int) {
        MyMovieList.watchMovies.remove(at: index)
    }
    
    static func createSeenMovie(_ movie: Movie) {
            MyMovieList.seenMovies.append(movie)
    }
        
    static func readSeenMovies(completion: @escaping () -> ()) {
            //An escaping closure is a closure thats called after the function it was passed to returns
            //A non escaping closure is a closure thats called within the function it was passed int
            //async your app wont wait for your code to finis. It'll continue on
    //        DispatchQueue.global(qos: .userInteractive).async {
    //
    //        }
    //        DispatchQueue.main.async {
    //            completion()
    //        }
    }
        
    static func updateSeenMovie(_ movie: Movie) {
            
    }
        
    static func deleteSeenMovie(at index: Int) {
        MyMovieList.seenMovies.remove(at: index)
    }
    
}
