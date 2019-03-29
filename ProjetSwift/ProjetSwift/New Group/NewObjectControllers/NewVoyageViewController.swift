//
//  NewVoyageViewController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

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

class NewVoyageViewController: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var newImageVoyage: UIImageView!
    @IBOutlet weak var newNameVoyage: UITextField!
    
    @IBOutlet weak var dateDebut: UITextField!
    @IBOutlet weak var dateFin: UITextField!
    
    private var datePicker: UIDatePicker?

    //var newVoyage : Voyage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        print(segue.identifier)
        if segue.identifier == "exitByConfirmFromNewVoyage" {
            if let nameVoyage: String  = self.newNameVoyage.text {
                SingletonStore.shared.currentVoyage = Voyage(nameVoyage: nameVoyage, startDate: Date(), stopDate:Date(), place: "newPlace")
            }
        }
        else{
            SingletonStore.shared.currentVoyage = nil
        }
        print(SingletonStore.shared.currentVoyage)
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
