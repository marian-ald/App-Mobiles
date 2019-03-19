//
//  PersonViewModel.swift
//  TP1v2
//
//  Created by Theodora-Augustina DRAGAN on 19/03/2019.
//  Copyright © 2019 Theodora-Augustina DRAGAN. All rights reserved.
//

import Foundation
class PersonViewModel {

    
    var myIndexedSet : [Person] = []
    
    init(personSet : PersonSet){
        for p in personSet {
            myIndexedSet.append(p)
        }
        
    }

}
