//
//  PersonPresenter.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation


import Foundation
import UIKit

protocol PersonPresenterProtocol {
    func text(ofPerson person:  Person) -> String
}


class PersonPresenter : PersonPresenterProtocol {
    fileprivate var firstName : String = ""
    fileprivate var lastName : String = ""
    
    
    func text(ofPerson person:  Person) -> String{
            return person.pfullname
    }
}
