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
    
    /*	
    @IBOutlet var payers: UIView!
    @IBOutlet var nonbeneficiaries: UIView!*/
    
    @IBOutlet weak var newImageDepense: UIImageView!
    @IBOutlet weak var newNameDepense: UITextField!
    @IBOutlet weak var dateDepense: UITextField!
    
    private var datePicker: UIDatePicker?
    let imagePicker = UIImagePickerController()
    
    var payerTableViewController: PayerTableViewController!
    @IBOutlet weak var payerTableView: UITableView!
    // should do wih beneficiaries as well
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.payerTableViewController = PayerTableViewController(tableView: self.payerTableView)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(NewVoyageViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewVoyageViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(gestureRecognizer)
        
        dateDepense.inputView = datePicker
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            
            if let nameDepense: String  = self.newNameDepense.text, let depenseDate: String = self.dateDepense.text
            {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                
                let objStartDate = dateFormatter.date(from: depenseDate)
                
                // Allocate the new Depense object
                let newDepense = Depense(nameDepense: nameDepense, dateDepense: objStartDate!)
                
                // If the user choose an image, add it in the current trip
                if self.newImageDepense != nil {
                    // Convert the image in jpeg format
                    if  let dataIm = self.newImageDepense?.image?.jpegData(compressionQuality: 1.0) {
                            newDepense.imageD = dataIm
                    }
                }
            }
        }
        else{
            SingletonStore.shared.currentVoyage = nil
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("this was called yippie")
        textField.resignFirstResponder()
        return true
    }
}


