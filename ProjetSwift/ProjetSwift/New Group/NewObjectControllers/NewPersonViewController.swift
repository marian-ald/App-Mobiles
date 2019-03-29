//
//  NewPersonViewController.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class NewPersonViewController: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var dateDebut: UITextField!
    @IBOutlet weak var dateFin: UITextField!
    
    
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
        //if segue.identifier == "addNewParticipantFromNewVoyage" || segue.identifier == "addNewParticipantFromOldVoyage" {
            let firstname : String  = self.firstNameTextField.text!
            let lastname  : String  = self.lastNameTextField.text!
            self.newPerson = Person(firstname: firstname, lastname: lastname, startDate : Date(), stopDate : Date())
        
        print("new person is : ")
        print(newPerson)
        print("my current voyage is : ")
        print(SingletonStore.shared.currentVoyage?.name)
            
            if let v  = VoyageDAO.fetchByName(name: SingletonStore.shared.currentVoyage?.name ?? ""){
                let myVoy = v[0]
                if let p = newPerson{
                    print(myVoy.name)
                    myVoy.addToContain(p)
    
                }
            }
        //}
        else{
            self.newPerson = nil
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
