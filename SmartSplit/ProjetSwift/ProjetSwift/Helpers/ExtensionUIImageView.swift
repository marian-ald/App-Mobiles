//
//  ExtensionUIImageView.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 03/04/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation


import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
