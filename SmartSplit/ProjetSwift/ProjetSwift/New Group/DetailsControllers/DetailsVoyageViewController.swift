//
//  DetailsVoyageViewController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class DetailsVoyageViewController: UIViewController {

    //var presenter: PersonPresenter!
    
    @IBOutlet weak var voyageName: UILabel!
    //@IBOutlet weak var voyageImage: UIImageView!
    
    @IBOutlet weak var voyageImage: UIImageView!
    //var voyage: Voyage?
    
    
    @IBAction func showTripParticipants(_ sender: Any) {
    }

    @IBAction func editTrip(_ sender: Any) {
    }
    
    @IBAction func addExpense(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let voyage = SingletonStore.shared.currentVoyage {
            self.voyageName.text = voyage.name

            
            //if let image = UIImage(data: voyage.image!) {
            //    self.voyageImage.image = image

            //} //dadea crash aici //else {
              //  self.voyageImage.image = UIImage(named: "defaultImage.png")
            //}
        } else{
            self.voyageName.text = "default"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
}
