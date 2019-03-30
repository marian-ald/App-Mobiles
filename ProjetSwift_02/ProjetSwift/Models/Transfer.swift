//
//  Transfer.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

extension Transfer {

    convenience init(amountTransfer: Float, isDone : Bool) {
        self.init(context: CoreDataManager.context)
        self.amountTransfer = amountTransfer
        self.isDone = isDone
    }
}

