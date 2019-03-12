//
//  ViewController.swift
//  swift0
//
//  Created by Theodora-Augustina DRAGAN on 12/03/2019.
//  Copyright © 2019 Aldescu Marian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var button: UIButton!
    
    @IBAction func changeTitle(_ sender: Any) {
        if let name = self.nameTextField.text {
            if name == "" {
                self.titleLabel.text = "String vide"
            } else {
                if name != self.titleLabel.text {
                    self.button.setTitleColor(.green, for: .normal)
                }
                else {
                    self.button.setTitleColor(.blue, for: .normal)
                }
                self.titleLabel.text = name
            }
        }
        else {
            self.titleLabel.text = "Swift01 Application"
        }
    }
    
}

