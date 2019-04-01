//
//  TransferCellController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class TransferCellController: UITableViewCell {


    @IBOutlet weak var namePayer: UILabel!
    @IBOutlet weak var namePaid: UILabel!
    @IBOutlet weak var transferAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
