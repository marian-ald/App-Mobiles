//
//  ExtensionUIView.swift
//  ProjetSwift
//
//  Created by user151921 on 3/30/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import Foundation


// Extension for UIView to get the active text field
extension UIView {
    
    // Get the only active text field from the viwew
    func getSelectedTextField() -> UITextField? {
        
        let totalTextFields = getTextFieldsInView(view: self)
        
        for textField in totalTextFields{
            if textField.isFirstResponder{
                return textField
            }
        }
        return nil
    }
    
    // Get all the text fields in the view
    func getTextFieldsInView(view: UIView) -> [UITextField] {
        
        var totalTextFields = [UITextField]()
        
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                totalTextFields += [textField]
            } else {
                totalTextFields += getTextFieldsInView(view: subview)
            }
        }
        return totalTextFields
    }}
