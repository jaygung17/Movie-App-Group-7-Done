//
//  MovieDetails.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 26/08/22.
//

import Foundation
import UIKit

class MovieDetails: UIViewController {
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var durationTime: UILabel!
    @IBOutlet var releasedDate: UILabel!
    @IBOutlet var Director: UILabel!
    
    var movie: Movie?
// Configure the view for the selected state
    override func viewDidLoad() {
        super.viewDidLoad()
//        bannerImage.image = movie?.movieBanner
//        posterImage.image = movie?.moviePoster
//        titleLabel.text = movie?.title
//        releasedDate.text = movie?.releaseDate
//        Director.text = movie?.director
    }
    func bindData () {
        bannerImage.image = movie?.movieBanner
        posterImage.image = movie?.moviePoster
        titleLabel.text = movie?.title
        releasedDate.text = movie?.releaseDate
        Director.text = movie?.director
        bindData()
    }

        
    }

