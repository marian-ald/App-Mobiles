//
//  Depense.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import UIKit

extension Depense {
    
    var nameD : String {
        get { return self.nameDepense ?? "" }
        set { self.nameDepense = newValue }
    }

    var dateD : Date {
        get { return self.dateDepense! }
        set { self.dateDepense = newValue }
    }
    
    var imageD : Data {
        get { return self.imageDepense! }
        set { self.imageDepense = newValue }
    }
    
    convenience init(nameDepense: String, dateDepense: Date) {
        self.init(context: CoreDataManager.context)
        self.nameD = nameDepense
        self.dateD = dateDepense
    }
}
