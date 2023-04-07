//
//  MovieTableViewCell.swift
//  MovieApp MVC
//
//  Created by Tuna Toramanoğlu on 3.04.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

  
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    
    func prepare(movie: Movie){
        imgPoster.image = UIImage(named: movie.imageWide)
        lblTitle.text = movie.title
        lblSummary.text = movie.summary
        lblRating.text = "⭐️ \(movie.rating)/10"
        lblCategories.text = movie.categoriesDescription
    }
    
}
