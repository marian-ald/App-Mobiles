//
//  Voyage.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Voyage {
    var nomVoyage : String
    var startDate : Date
    var stopDate : Date
    var persons : PersonSet

    init(nomVoyage : String, startDate : Date, stopDate : Date) {
        self.nomVoyage = nomVoyage
        self.startDate = startDate
        self.stopDate = stopDate
        self.persons = PersonSet()
    }

}
