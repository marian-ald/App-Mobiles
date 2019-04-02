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
    
    ///////////////////////////////////
    // Date picker attributes
    private var datePicker: UIDatePicker?
    private var startDateTrip: Date? = nil
    private var stopDateTrip: Date? = nil

    
    var newPerson : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.dateDebut.delegate = self
        self.dateFin.delegate = self
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(NewVoyageViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewVoyageViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(gestureRecognizer)
        
        dateDebut.inputView = datePicker
        dateFin.inputView = datePicker
    }
    
    @objc func viewTapped (gestureRecognizer : UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Pentru memorare date, se poate folosi " datePicker.date "
        //print(datePicker.date)
        
        if let activeTextField = view.getSelectedTextField() {
            activeTextField.text = dateFormatter.string(from: datePicker.date)
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //if segue.identifier == "addNewParticipantFromNewVoyage" || segue.identifier == "addNewParticipantFromOldVoyage" {
        let firstname : String  = self.firstNameTextField.text!
        let lastname  : String  = self.lastNameTextField.text!
        
        var objStartDate: Date?
        var objStopDate: Date?
        
        // If the user has added fin/debout date, store it, else
        // the default values are those from the current voyage
        let startDate: String = self.dateDebut.text!
        let stopDate: String = self.dateFin.text!
        
        if startDate != "" {
                
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
        
            objStartDate = dateFormatter.date(from: startDate)
            print("data noua")
        } else {
            objStartDate = (SingletonStore.shared.currentVoyage?.startDate)!
            print("data crt voyage")
        }
        
        if stopDate != "" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"

            objStopDate = dateFormatter.date(from: stopDate)
            print("data noua")
        } else {
            objStopDate = (SingletonStore.shared.currentVoyage?.stopDate)!
            print("data crt voyage")
        }
        
        self.newPerson = Person(firstname: firstname, lastname: lastname, startDate : objStartDate!, stopDate : objStopDate!)
        
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
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("THIS WAS CQALEED OR NOT ????")
        textField.resignFirstResponder()
        return true
    }
    
}
