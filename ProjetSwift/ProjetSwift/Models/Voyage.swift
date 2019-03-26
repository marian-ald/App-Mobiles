//
//  Voyage.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

extension Voyage {

    convenience init(nameVoyage : String, startDate : Date, stopDate : Date, place : String, image: String) {
        self.init(context: CoreDataManager.context)
        self.image = image
        self.nameVoyage = nameVoyage
        self.place = place
        self.startDate = startDate
        self.stopDate = stopDate
    }
    
}
