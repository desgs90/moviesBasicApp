//
//  SecondViewController.swift
//  MoviesApp
//
//  Created by Diego Movius on 7/13/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import UIKit
import Haneke

class SecondViewController: UIViewController {
	
	public var currentMovie:Movie? = nil
	
	//MARK:- IBOutlets
	@IBOutlet weak var moviePoster: UIImageView!
	@IBOutlet weak var movieData: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if currentMovie != nil {
			showMovieInformation(currentMovie!)
			self.title = currentMovie?.title
		}
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	fileprivate func showMovieInformation(_ movie:Movie) {
		var actors = "Actors: "
		for actor in movie.actors {
			if actors.count > 0 {
				actors += "\n"
			}
			actors += "\(actor)"
		}
		self.movieData.text = actors
		self.moviePoster.hnk_setImage(from: URL(string: movie.poster))
	}
}
