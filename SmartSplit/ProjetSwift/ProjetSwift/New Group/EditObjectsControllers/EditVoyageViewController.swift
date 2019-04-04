//
//  EditVoyageViewController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class EditVoyageViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var newNameVoyage: UITextField!
    @IBOutlet weak var newImageVoyage: UIImageView!
    @IBOutlet weak var dateDebut: UITextField!
    @IBOutlet weak var dateFin: UITextField!
    
    //var tableViewController: PersonsTableViewController!
    //@IBOutlet weak var tableView: UITableView!
    
    private var datePicker: UIDatePicker?
    private var startDateTrip: Date? = nil
    private var stopDateTrip: Date? = nil
    

    @IBOutlet var popUpDelete: UIView!
    
    let imagePicker = UIImagePickerController()
    
    //var newVoyage : Voyage?
    
    
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
    
    @IBAction func confirmButton(_ sender: Any) {
        if self.newNameVoyage.text == "" || self.dateDebut.text == "" || self.dateFin.text == "" {
            print("ar trebui sa fac un pop up")
        } else {
            print("intru aici")
            performSegue(withIdentifier: "confirmedSave", sender: self)
        }
    }
    
    @IBAction func confirmDelete(_ sender: Any) {
        print("confirm delete")
        PopUp.shared.animateOut(subView: self.popUpDelete)
        //print(SingletonStore.shared.currentVoyage?.name)
        
        if let nameVoyage = self.newNameVoyage.text {
            // Find the old Depense object
            let oldVoyage : Voyage = VoyageDAO.fetchByName(name: nameVoyage)![0]
            
            if let persons = PersonDAO.fetchAll(){
                for person in persons {
                    //oldDepense.removeFromPaidBy(person)
                    //oldDepense.removeFromNoBenefitBy(person)
                    if let depenses = DepenseDAO.fetchAll() {
                        for depense in depenses {
                            person.removeFromPaid(depense)
                            person.removeFromNoBenefit(depense)
                        }
                    }
                    oldVoyage.removeFromContain(person)
                    
                }
            }
            
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            CoreDataManager.context.delete(oldVoyage)
            /*
            if let assocs = AssocDepensePersonDAO.fetchByDepenseName(nameDepense: (SingletonStore.shared.currentDepense?.nameD)!) {
                for assoc in assocs {
                    AssocDepensePersonDAO.delete(assoc: assoc)
                }
            }
            */
        }
        performSegue(withIdentifier: "confirmedSave", sender: self)
    }
    
    @IBAction func cancelDelete(_ sender: Any) {
         print("cancel delete")
        PopUp.shared.animateOut(subView: self.popUpDelete)
    }
    
    @IBAction func deleteVoyage(_ sender: Any) {
        PopUp.shared.animateIn(subView: popUpDelete, view: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpDelete.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
        //tableViewController = PersonsTableViewController(tableView: self.tableView)
        
        // self.newImageVoyage.delegate = self
        //self.newNameVoyage.delegate = self
        //self.dateDebut.delegate = self
        //self.dateFin.delegate = self
        
        /// Update the fields with de current voyage details
        let currentVoyage = SingletonStore.shared.currentVoyage
        /// The name of the current voyage
        self.newNameVoyage.text = currentVoyage?.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        self.dateDebut.text = dateFormatter.string(from: (currentVoyage?.startDate)!)
        self.dateFin.text = dateFormatter.string(from: (currentVoyage?.stopDate)!)

        
        if let image = UIImage(data: currentVoyage!.image!) {
            self.newImageVoyage.image = image
        }
        
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
                //SingletonStore.shared.currentVoyage = Voyage(nameVoyage: nameVoyage, startDate: objStartDate!, stopDate: objStopDate!, place: "newPlace")
                /*
                // If the user choose an image, add it in the current trip
                if self.newImageVoyage != nil {
                    // Convert the image in jpeg format
                    //if  let data = self.newImageVoyage?.image?.jpegData(compressionQuality: 1.0) {
                    if let data = self.newImageVoyage?.image?.pngData() {
                        SingletonStore.shared.currentVoyage?.image = data
                    }
                }
                 */ 
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
