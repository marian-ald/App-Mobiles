//
//  Voyage.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

extension Voyage {
/*
    var vname: String {
        get { return self.vname }
        set { self.vname = newValue }
    }
    
    var vplace: String {
        get { return self.vplace }
        set { self.vplace = newValue }
    }
    
    var vstartDate: Date {
        get { return self.vstartDate }
        set { self.vstartDate = newValue }
    }
    
    var vstopDate: Date {
        get { return self.vstopDate }
        set { self.vstopDate = newValue }
    }
 */
    convenience init(nameVoyage : String, startDate : Date, stopDate : Date, place : String) {
        self.init(context: CoreDataManager.context)
        self.vimage = nil
        self.vname = nameVoyage
        self.vplace = place
        self.vstartDate = startDate
        self.vstopDate = stopDate
    }
    
}
