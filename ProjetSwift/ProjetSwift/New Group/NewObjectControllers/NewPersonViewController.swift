//
//  NewPersonViewController.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class NewPersonViewController: UIViewController, UITextFieldDelegate  {

    //@IBOutlet weak var firstnameTextField: UITextField!
    //@IBOutlet weak var lastnameTextField: UITextField!

    var newPerson : Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "okNewPersonSegue" {
       //     let firstname : String  = self.firstnameTextField.text!
       //     let lastname  : String  = self.lastnameTextField.text!
        //    self.newPerson = Person(firstname: firstname, lastname: lastname, startDate : Date(), stopDate : Date())
        }
        else{
            self.newPerson = nil
        } }
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
