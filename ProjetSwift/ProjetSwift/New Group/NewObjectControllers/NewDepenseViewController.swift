//
//  NewDepenseViewController.swift
//  ProjetSwift
//
//  Created by user152227 on 3/31/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import Foundation


class NewDepenseViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet var payers: UIView!
    
    @IBOutlet var nonbeneficiaries: UIView!
    @IBOutlet weak var newImageDepense: UIImageView!
    @IBOutlet weak var newNameDepense: UITextField!
    @IBOutlet weak var dateDepense: UITextField!
    
    private var datePicker: UIDatePicker?
    let imagePicker = UIImagePickerController()
    
    var newDepense : Depense?
    
    @IBAction func addImage(_ sender: Any) {
        print("adaug imagine")
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum  // sau .photolibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage? {
            self.newImageDepense?.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        if self.newNameDepense.text == "" // || self.dateDepense.text == ""
        {
            print("ar trebui sa fac un pop up")
        } else {
            print("intru aici")
            performSegue(withIdentifier: "confirmedSave", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //tableViewController = PersonsTableViewController(tableView: self.tableView)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(NewVoyageViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewVoyageViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(gestureRecognizer)
        
         dateDepense.inputView = datePicker
        
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
        /*
        if segue.identifier == "confirmedSave" {
            
            if let nameVoyage: String  = self.newNameDepense.text, let depenseDate: String = self.depenseDate.text
            {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                
                let objStartDate = dateFormatter.date(from: startDate)
                let objStopDate = dateFormatter.date(from: stopDate)
                
                // Allocate the new trip object
                SingletonStore.shared.currentVoyage = Voyage(nameVoyage: nameVoyage, startDate: objStartDate!, stopDate: objStopDate!, place: "newPlace")
                
                // If the user choose an image, add it in the current trip
                if self.newImageVoyage != nil {
                    // Convert the image in jpeg format
                    if  let data = self.newImageVoyage?.image?.jpegData(compressionQuality: 1.0) {
                        SingletonStore.shared.currentVoyage?.image = data
                    }
                }
            }
        }
        else{
            SingletonStore.shared.currentVoyage = nil
        }*/
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
        print("this was called yippie")
        textField.resignFirstResponder()
        return true
    }
}


