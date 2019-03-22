//
//  Transfer.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Transfer {
    var amount : Float
    var payer: Person
    var paid: Person
    var idDone: Bool = false
    
    init(amount: Float, payer: Person, paid: Person) {
        self.amount = amount
        self.payer = payer
        self.paid = paid
    }
}
