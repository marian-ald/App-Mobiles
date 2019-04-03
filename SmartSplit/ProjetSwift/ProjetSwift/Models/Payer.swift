//
//  Payer.swift
//  ProjetSwift
//
//  Created by user152227 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Payer {
    
    var isBeneficiary : Bool
    var fullNamePayer : String
    var sumPaid : Float
    //var depenseName : String
    
    init(isBeneficiary : Bool, fullNamePayer : String, sumPaid : Float){
        self.isBeneficiary = isBeneficiary
        self.fullNamePayer = fullNamePayer
        self.sumPaid = sumPaid
    }
    
}
