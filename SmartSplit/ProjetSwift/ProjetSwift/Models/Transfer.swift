//
//  Transfer.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Transfer {
    private var fullnameS : String
    private var fullnameR : String
    private var sumT : Float
    
    var fullnameSender : String{
        get { return self.fullnameS }
        set { self.fullnameS = newValue }
    }
    
    var fullnameReceiver : String {
        get { return self.fullnameR }
        set { self.fullnameS = newValue }
    }
    
    var sum : Float {
        get { return self.sumT }
        set { self.sumT = newValue }
    }
    
    init(fullnameSender : String, fullnameReceiver: String, sum: Float) {
        self.fullnameS = fullnameSender
        self.fullnameR = fullnameReceiver
        self.sumT = sum
    }
}

