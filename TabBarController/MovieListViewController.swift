//
//  MovieListViewController.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 30/08/22.
//
import UIKit
class MovieListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var listMovie: [Movie] = []
    @IBOutlet var movieListTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovie.count
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
        listMovie = DummyMovieData ()
        
        movieListTV.delegate = self
        movieListTV.dataSource = self
        //register XIB dengan table view bernama movieListTV,
        self.movieListTV.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "XibMovieList")
    }
    //ketika klik cell, mengarah ke movie details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetails (nibName: "MovieDetails", bundle: nil)
        vc.movie = listMovie[indexPath.row]
//        self.present(vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
