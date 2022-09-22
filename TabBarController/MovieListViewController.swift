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
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var imageContainer: UIView!
    //property for refresh
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl ()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell ini merupakan MovieListCell, dan sudah memiliki properti
        let cell = tableView.dequeueReusableCell(withIdentifier: "XibMovieList") as! MovieListCell
        //Assign untuk menunjukkan movie yang berbeda,
        let movie = listMovie[indexPath.row]
        //        cell.Banner.image = Movie.movieBanner
        cell.bindData(with: movie)
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        refreshControl.beginRefreshing()
        getMovieListData()
    }
    
    func showErrorLabel (with message: String){
        errorLabel.isHidden = false
        errorLabel.text = message
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    @objc
    func refresh (){
        listMovie.removeAll()
        getMovieListData()
    }
    //ketika klik cell, mengarah ke movie details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetails (nibName: "MovieDetails", bundle: nil)
        //        vc.movie = listMovie[indexPath.row]
        //        self.present(vc, animated: true)
        vc.id = listMovie[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! MovieListCell
        
        cell.getMovieBanner()
    }
    
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! MovieListCell
        cell.cancelDownloadImageKingfisher()
    }
}

//MARK: Networking
extension MovieListViewController {
    //call API
    func getMovieListData (){
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
        
        URLSession.shared.dataTask(with:url){(data, response, error) in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.errorLabel.isHidden = true
            }
            
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode([MovieList].self,from:data!)
                DispatchQueue.main.async {
                    self.listMovie = movies.shuffled()
                    self.movieListTV.reloadData()
                }
            } catch {
                //                print ("Error")
                self.showErrorLabel(with: error.localizedDescription)
            }
        }.resume()
    }
    
    //Bind Data
    func bindData (with movies: [MovieList]){
        DispatchQueue.main.async {
            self.listMovie = movies
            self.movieListTV.reloadData()
            
        }
    }
    
    //setup table view
    func setupTableView(){
        movieListTV.delegate = self
        movieListTV.dataSource = self
        //register XIB dengan table view bernama movieListTV,
        self.movieListTV.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "XibMovieList")
        movieListTV.refreshControl = refreshControl
    }
   
}
