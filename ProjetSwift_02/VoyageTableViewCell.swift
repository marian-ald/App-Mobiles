//
//  VoyageTableViewCell.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class VoyageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageVoyage: UIImageView!
    @IBOutlet weak var nameVoyage: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
