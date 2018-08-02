//
//  Movie.swift
//  MoviesApp
//
//  Created by Diego Movius on 7/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import Foundation

class Movie: NSObject {
	
	public var title: String
	public var poster: String
	public var actors: [String]
	
	public init(title:String, poster:String, actors:[String]) {
		self.title = title
		self.poster = poster
		self.actors = actors
	}
}


