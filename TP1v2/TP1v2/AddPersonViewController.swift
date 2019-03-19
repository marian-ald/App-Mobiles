//
//  AddPersonViewController.swift
//  TP1
//
//  Created by Marian ALDESCU on 18/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backItem?.title = "Back"
    }
    
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var birthDate: UITextField!
    
    @IBAction func confirmSave(_ sender: Any) {
        
        if let fN = firstName.text, let lN = lastName.text {
            
            let newPers = Person(lastN: lN, firstN: fN)
            let pers = (UIApplication.shared.delegate as? AppDelegate)?.pers
            
            pers?.add(person: newPers)
            performSegue(withIdentifier: "segueBackFromAdd", sender: self)
        }
        
        else {
            performSegue(withIdentifier: "segueAddPerson", sender: self)
        }
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "segueBackFromAdd", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
