//
//  MovieDetailVC.swift
//  MovieApp MVC
//
//  Created by Tuna Toramanoğlu on 31.03.2023.
//

import UIKit

class MovieDetailVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblcat: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblSummary: UITextView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        image.image = UIImage(named: movie.imageSmall)
        lblTitle.text = movie.title
        lblRating.text = "⭐️ \(movie.rating)/10"
        lblSummary.text = movie.summary
        lblcat.text = movie.categoriesDescription
        lblDuration.text = movie.duration
        
    }

}
