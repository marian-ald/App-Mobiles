//
//  PopUp.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 03/04/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import UIKit

class PopUp {

    static let shared = PopUp()
  
    private init() {
    }
    
    func animateIn(subView: UIView, view: UIView) {
        view.addSubview(subView)
        subView.center = view.center
        
        subView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        subView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            subView.alpha = 1
            subView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(subView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            subView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            subView.alpha = 0
        }) { (success: Bool) in
            subView.removeFromSuperview()
        }
        //self.popUpMessage.text = ""
    }
}
