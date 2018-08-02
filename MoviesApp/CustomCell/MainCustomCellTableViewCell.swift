//
//  MainCustomCellTableViewCell.swift
//  MoviesApp
//
//  Created by Diego Movius on 7/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import UIKit
import Haneke

class MainCustomCellTableViewCell: UITableViewCell {

	@IBOutlet weak var imageCustomCell: UIImageView!
	@IBOutlet weak var labelCustomCell: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		labelCustomCell.text = ""
		
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
