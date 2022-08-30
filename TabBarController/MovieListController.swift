//
//  MovieListController.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 26/08/22.
//

import Foundation
import UIKit

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
        listMovie = DummyMovieData ()
        
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
        self.present(vc, animated: true)
        }

       
}
    struct Movie {
        let id: UUID
        let title: String
        let originalTitle: String
        let description: String
        let movieBanner: UIImage
        let moviePoster: UIImage
        let director: String
        let duration: Int
        let releaseDate: String
    }
    
func DummyMovieData () -> [Movie] {
    //() menandakan membuat object untuk membuat UUID
    return [Movie(id: UUID(), title: "Castle in the Sky", originalTitle: "天空の城ラピュタ", description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.", movieBanner: UIImage(named: "BannerCastle")!, moviePoster: UIImage(named:"CastleInTheSky")!, director: "Hayao Miyazaki", duration: 124, releaseDate: "1986"),
            Movie(id: UUID(), title: "Grave of the Fireflies", originalTitle: "火垂るの墓", description: "In the latter part of World War II, a boy and his sister, orphaned when their mother is killed in the firebombing of Tokyo, are left to survive on their own in what remains of civilian life in Japan. The plot follows this boy and his sister as they do their best to survive in the Japanese countryside, battling hunger, prejudice, and pride in their own quiet, personal battle.", movieBanner: UIImage(named: "BannerGrave")!, moviePoster: UIImage(named: "GraveoftheFireflies")!, director: "Isao Takahata", duration: 89, releaseDate: "1988"),
            Movie(id: UUID(), title: "My Neighbor Totoro", originalTitle: "となりのトトロ", description: "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.", movieBanner: UIImage(named: "BannerTotoro")!, moviePoster: UIImage(named: "MyNeighbourTotoro")!, director: "Hayao Miyazaki", duration: 86, releaseDate: "1988"),
            Movie(id: UUID(), title: "Kiki's Delivery Service", originalTitle: "魔女の宅急便", description: "A young witch, on her mandatory year of independent life, finds fitting into a new community difficult while she supports herself by running an air courier service.", movieBanner: UIImage(named: "BannerKiki")!, moviePoster: UIImage(named: "KikiDeliveryService")!, director: "Hayao Miyazaki", duration: 102, releaseDate: "1989"),
            Movie(id: UUID(), title: "Only Yesterday", originalTitle: "おもひでぽろぽろ", description: "It’s 1982, and Taeko is 27 years old, unmarried, and has lived her whole life in Tokyo. She decides to visit her family in the countryside, and as the train travels through the night, memories flood back of her younger years: the first immature stirrings of romance, the onset of puberty, and the frustrations of math and boys. At the station she is met by young farmer Toshio, and the encounters with him begin to reconnect her to forgotten longings. In lyrical switches between the present and the past, Taeko contemplates the arc of her life, and wonders if she has been true to the dreams of her childhood self.", movieBanner: UIImage(named: "BannerMaking")!, moviePoster: UIImage(named: "Makingof")!, director: "Isao Takahata", duration: 118, releaseDate: "1991")]
    
}
    
