//
//  BilanCellController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class BilanCellController: UITableViewCell {
    
    @IBOutlet weak var payerName: UILabel!
    @IBOutlet weak var paidName: UILabel!
    @IBOutlet weak var amountTransfer: UILabel!
    @IBOutlet weak var makeTransfer: UISwitch!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
