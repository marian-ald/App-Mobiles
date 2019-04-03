//
//  SingletonStore.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class SingletonStore {
    
    public var currentVoyage : Voyage?
    public var currentDepense : Depense?
    
    static let shared = SingletonStore()
    
    
    // Initialization
    
    private init() {
    }
}
