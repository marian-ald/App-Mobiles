//
//  Depense.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

extension Depense {

    convenience init(nameDepense: String, dateDepense: Date) {
        self.init(context: CoreDataManager.context)
        self.nameDepense = nameDepense
        self.dateDepense = dateDepense
    }
}
