//
//  Voyage.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Voyage {
    var nameVoyage : String
    var startDate : Date
    var stopDate : Date
    var persons : PersonSet

    init(nameVoyage : String, startDate : Date, stopDate : Date) {
        self.nameVoyage = nameVoyage
        self.startDate = startDate
        self.stopDate = stopDate
        self.persons = PersonSet()
    }
}
