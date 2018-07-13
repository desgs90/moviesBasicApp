//
//  ViewController.swift
//  MoviesApp
//
//  Created by Diego Movius on 7/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import UIKit
import Haneke

class ViewController: UIViewController {

	//MARK:- IBOutlets
	@IBOutlet weak var tableView: UITableView!
	
	//MARK: publi vars
	fileprivate var networkManager = NetworkManager()
	fileprivate var movieSelected:Movie? = nil
	
	//MARK: Lazy ar
	lazy var moviesDao = MoviesDAO.instance
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//registe cell
		self.tableView.register(UINib(nibName: "MainCustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCustomCellTableViewCell")
		networkManager.delegate = self
		networkManager.getMovies()
		// Do any additional setup after loading the view, typically from a nib.

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	fileprivate func localUpdateMovies() {
		self.tableView.reloadData()
	}


}

//MARK:- TableDelegate
extension ViewController: UITableViewDelegate,UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return moviesDao.getAllMovies().count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "MainCustomCellTableViewCell") as! MainCustomCellTableViewCell
		

		let currentMovie = moviesDao.getAllMovies()[indexPath.row]
		
		cell.labelCustomCell.text = currentMovie.title
		cell.imageCustomCell.hnk_setImage(from: URL(string: currentMovie.poster))
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		movieSelected = moviesDao.getAllMovies()[indexPath.row]
		performSegue(withIdentifier: "ShowMovieData", sender: nil)
		
	}
}

//MARK:- Delegate Networking
extension ViewController: NetworkManagerDelegate {
	func updateMovies() {
		self.localUpdateMovies()
	}
}

//MARK:- Segues

extension ViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowMovieData" {
			if movieSelected == nil {
				return;
			}
			if let vc = segue.destination as? SecondViewController {
				vc.currentMovie = movieSelected
			}
			
		}
	}
	
}
