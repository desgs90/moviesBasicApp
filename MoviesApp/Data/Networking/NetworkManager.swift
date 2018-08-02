//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Diego Movius on 7/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate: class {
	func updateMovies()
}
class NetworkManager: NSObject {
	
	weak var delegate: NetworkManagerDelegate?
	lazy var moviesDAO = MoviesDAO.instance
	
	func getMovies() {
		let url = URL(string: networkRequest.moviesURL)
		
		let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
			if error == nil {
				//parsing
				do {
					
					if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] {
						print("Diego")
						//ParseInfo
						self.moviesDAO.parseMoviesInfo(jsonObject)
						DispatchQueue.main.async {
							self.delegate?.updateMovies()
						}
					}
				} catch {
					print("error parsing data")
				}
			}
		}
		task.resume()
	}
}


struct networkRequest {
	static let moviesURL = "http://trailers.apple.com/trailers/home/feeds/just_added.json"
	
}
