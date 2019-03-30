//
//  Voyage.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

extension Voyage {

    var name: String {
        get { return self.vname ?? "" }
        set { self.vname = newValue }
    }
    
    var place: String {
        get { return self.vplace ?? "" }
        set { self.vplace = newValue }
    }
    
    var startDate: Date {
        get { return self.vstartDate ?? Date() }
        set { self.vstartDate = newValue }
    }
    
    var stopDate: Date {
        get { return self.vstopDate ?? Date() }
        set { self.vstopDate = newValue }
    }
    
    var image: Data {
        get { return self.vimage ?? Data() }
        set { self.vimage = newValue }
    }
    
    
    convenience init(nameVoyage : String, startDate : Date, stopDate : Date, place : String) {
        self.init(context: CoreDataManager.context)
        self.vimage = nil
        self.name = nameVoyage
        self.place = place
        self.startDate = startDate
        self.stopDate = stopDate
    }
    
    
}
