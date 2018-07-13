//
//  MoviesDAO.swift
//  MoviesApp
//
//  Created by Diego Movius on 7/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import Foundation

class MoviesDAO: NSObject {
	public static let instance = MoviesDAO()
	
	fileprivate var allMovies = [Movie]()
	
	public func parseMoviesInfo(_ data: [[String: Any]]) {
		for item in data {
			var title = ""
			var poster = ""
			var actors = [String]()
			
			if let existTitle = item["title"] {
				title = existTitle as! String
			}
			if let existPoster = item["poster"] {
				poster = existPoster as! String
			}
			if let existActors = item["actors"] as? [String] {
				for actor in existActors {
					actors.append(actor)
				}
			}
			
			let newMovie = Movie(title: title, poster: poster, actors: actors)
			allMovies.append(newMovie)
		}
		
	}
	
	func getAllMovies() -> [Movie] {
		return allMovies
	}
}
