//
//  PersonDetailsViewController.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    var presenter: PersonPresenter!

    var person : Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let aperson = self.person{
            self.lastnameLabel.text = aperson.plastname
            self.firstnameLabel.text = aperson.pfirstname
        } else{
            self.lastnameLabel.text = ""
            self.firstnameLabel.text = ""
        } }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!

}
