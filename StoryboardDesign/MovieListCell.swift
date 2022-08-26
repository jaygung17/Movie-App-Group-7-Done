//
//  MovieListCell.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 26/08/22.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet var Banner: UIImageView!
    @IBOutlet var Title: UILabel!
    @IBOutlet var OriginalTitle: UILabel!
    @IBOutlet var Description: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
