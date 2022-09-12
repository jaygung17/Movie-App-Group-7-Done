//
//  MovieListController.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 26/08/22.
//

import Foundation
import UIKit
import SwiftUI

class MovieListController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var listMovie: [Movie] = []
    @IBOutlet var movieListTV: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell ini merupakan MovieListCell, dan sudah memiliki properti
        let cell = tableView.dequeueReusableCell(withIdentifier: "XibMovieList") as! MovieListCell
        //Assign untuk menunjukkan movie yang berbeda,
        let Movie = listMovie[indexPath.row]
        cell.Banner.image = Movie.movieBanner
        cell.Title.text = Movie.title
        cell.OriginalTitle.text = Movie.originalTitle
        cell.Description.text = Movie.description

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
               //mendapatkan list movienya
//        listMovie = DummyMovieData ()
        
        movieListTV.delegate = self
        movieListTV.dataSource = self
        
        //ketika sudah memilih atu klik cell itu...

        func numberOfSections(in tableView: UITableView) -> Int {
            1
        }
        //register XIB dengan table view bernama movieListTV,
        self.movieListTV.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "XibMovieList")
    }
    //ketika sudah memilih atu klik cell itu...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //mengarah ke detail yang berupa xib
        let vc = MovieDetails (nibName: "MovieDetails", bundle: nil)
        vc.id = listMovie[indexPath.row].id
        self.present(vc, animated: true)
        }

       
}
    struct Movie {
        let id: String
        let title: String
        let originalTitle: String
        let description: String
        let movieBanner: UIImage
        let moviePoster: UIImage
        let director: String
        let duration: Int
        let releaseDate: String
    }
    
