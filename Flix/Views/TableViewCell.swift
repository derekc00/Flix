//
//  MovieCell.swift
//  Flix
//
//  Created by Derek Chang on 1/12/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtextLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    
    // MARK: - Lifecycle methods (can be deleted)
    override func awakeFromNib() {
        super.awakeFromNib()
        subtextLabel.sizeToFit()
        subtextLabel.numberOfLines = 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
