//
//  MovieListViewController.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 30/08/22.
//
import UIKit
import Kingfisher
class MovieListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var listMovie: [MovieList] = []
    
    @IBOutlet var movieListTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell ini merupakan MovieListCell, dan sudah memiliki properti
        let cell = tableView.dequeueReusableCell(withIdentifier: "XibMovieList") as! MovieListCell
        //Assign untuk menunjukkan movie yang berbeda,
        let Movie = listMovie[indexPath.row]
//        cell.Banner.image = Movie.movieBanner
        getMovieBanner(for: Movie.movieBanner, imageView: cell.Banner)
        cell.Title.text = Movie.title
        cell.OriginalTitle.text = Movie.originalTitle
        cell.Description.text = Movie.movieListDescription

        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mendapatkan list movienya
//        listMovie = DummyMovieData ()
        
        getMovieListData()
        movieListTV.delegate = self
        movieListTV.dataSource = self
        //register XIB dengan table view bernama movieListTV,
        self.movieListTV.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "XibMovieList")
    }
    
    
    
    //ketika klik cell, mengarah ke movie details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetails (nibName: "MovieDetails", bundle: nil)
//        vc.movie = listMovie[indexPath.row]
//        self.present(vc, animated: true)
        vc.id = listMovie[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: Networking
extension MovieListViewController {
    //call API
    func getMovieListData (){
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
        URLSession.shared.dataTask(with:url){(data, response, error) in
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode([MovieList].self,from:data!)
                DispatchQueue.main.async {
                    self.listMovie = movies
                    self.movieListTV.reloadData()
                    }
            } catch {
                print ("Error")
            }
        }.resume()
    }
    func bindData (with)
    //function untuk menampilkan banner
    func getMovieBanner (for url: String, imageView: UIImageView) {
        let url = URL(string: url)!
        imageView.kf.setImage(with: url)

    }
}
