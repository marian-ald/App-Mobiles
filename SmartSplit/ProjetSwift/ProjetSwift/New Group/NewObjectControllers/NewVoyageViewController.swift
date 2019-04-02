//
//  NewVoyageViewController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import Foundation


class NewVoyageViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var newImageVoyage: UIImageView? = nil
    @IBOutlet weak var newNameVoyage: UITextField!
    
    @IBOutlet weak var dateDebut: UITextField!
    @IBOutlet weak var dateFin: UITextField!
    
    
    @IBOutlet var popUpMissing: UIView!
    @IBOutlet weak var popUpMessage: UILabel!
    
    //var tableViewController: PersonsTableViewController!
    //@IBOutlet weak var tableView: UITableView!

    private var datePicker: UIDatePicker?
    private var startDateTrip: Date? = nil
    private var stopDateTrip: Date? = nil

    
    let imagePicker = UIImagePickerController()
    
    //var newVoyage : Voyage?
    
    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    
    func animateIn() {
        self.view.addSubview(popUpMissing)
        popUpMissing.center = self.view.center
        
        popUpMissing.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpMissing.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.popUpMissing.alpha = 1
            self.popUpMissing.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpMissing.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUpMissing.alpha = 0
        }) { (success: Bool) in
            self.popUpMissing.removeFromSuperview()
        }
        self.popUpMessage.text = ""
    }

    
    @IBAction func confirmButton(_ sender: Any) {
        var popUpMessage: String = "Ajoutez:\n"
        var turnOnPopUp: Bool = false
        
        if self.newNameVoyage.text == "" {
            popUpMessage += "> Nom du voyage\n"
            turnOnPopUp = true
        }
        if self.dateDebut.text == "" {
            popUpMessage += "> Date debut\n"
            turnOnPopUp = true
        }
        if self.dateFin.text == "" {
            popUpMessage += "> Date fin"
            turnOnPopUp = true
        }
        if turnOnPopUp == true {
            self.popUpMessage.text = popUpMessage
            animateIn()
        } else {
            performSegue(withIdentifier: "confirmedSave", sender: self)
        }
    }

    
    @IBAction func addImage(_ sender: Any) {
        print("adaug imagine")
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum  // sau .photolibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage? {
            self.newImageVoyage?.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //tableViewController = PersonsTableViewController(tableView: self.tableView)
        
        // self.newImageVoyage.delegate = self
        //self.newNameVoyage.delegate = self
        //self.dateDebut.delegate = self
        //self.dateFin.delegate = self
        
        self.popUpMissing.layer.cornerRadius = 5
        
        
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
        
        if segue.identifier == "confirmedSave" {
            
            if let nameVoyage: String  = self.newNameVoyage.text, let startDate: String = self.dateDebut.text, let stopDate: String = self.dateFin.text {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                
                let objStartDate = dateFormatter.date(from: startDate)
                let objStopDate = dateFormatter.date(from: stopDate)

                // Allocate the new trip object
                SingletonStore.shared.currentVoyage = Voyage(nameVoyage: nameVoyage, startDate: objStartDate!, stopDate: objStopDate!, place: "newPlace")
                
                // If the user choose an image, add it in the current trip
                if self.newImageVoyage != nil {
                    // Convert the image in jpeg format
                    if let data = self.newImageVoyage?.image?.pngData() {
                        SingletonStore.shared.currentVoyage?.image = data
                    }
                }
 
            }
        }
        else{
            SingletonStore.shared.currentVoyage = nil
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
        print("this was called yippie")
        textField.resignFirstResponder()
        return true
    }
}

