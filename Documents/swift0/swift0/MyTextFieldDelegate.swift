//
//  MyTextFieldDelegate.swift
//  swift0
//
//  Created by Theodora-Augustina DRAGAN on 12/03/2019.
//  Copyright © 2019 Aldescu Marian. All rights reserved.
//

import Foundation
import UIKit

class MyTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
