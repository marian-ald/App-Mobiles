//
//  Depense.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Depense {
    var nameDepense : String
    var dateDepense : Date
    var participants : PersonSet
    var nonBeneficiants : PersonSet
    
    init(nameDepense: String, dateDepense: Date) {
        self.nameDepense = nameDepense
        self.dateDepense = dateDepense
        self.participants = PersonSet()
        self.nonBeneficiants = PersonSet()
    }


}
