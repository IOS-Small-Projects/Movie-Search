//
//  MovieListTableViewCell.swift
//  Movie-Search-Rohit
//
//  Created by Arpit Gandhi on 17/09/16.
//  Copyright © 2016 Ignite Solutions. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
