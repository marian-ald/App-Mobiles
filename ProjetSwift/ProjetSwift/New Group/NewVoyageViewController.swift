//
//  NewVoyageViewController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class NewVoyageViewController: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var newImageVoyage: UIImageView!
    
    @IBOutlet weak var newNameVoyage: UITextField!
    
    @IBAction func confirmAddVoyage(_ sender: Any) {
    }
    
    var newVoyage : Voyage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "okNewVoyageSegue" {
            let nameVoyage: String  = self.newNameVoyage.text!
            SingletonStore.shared.currentVoyage = Voyage(nameVoyage: nameVoyage, startDate: Date(), stopDate:Date(), place: "newPlace", image: "imagePath")
            // save unde ?
        }
        else{
            self.newVoyage = nil
        }
    }
    
    
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
    }
    
}

