//
//  ViewController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var titleOutlet: UILabel!
    var tableViewController: VoyagesTableViewController!
    @IBOutlet weak var tableView: UITableView!
    
    var shouldGoToNextScreen : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableViewController = VoyagesTableViewController(tableView: self.tableView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(segue)
        if segue.identifier == "showDetailsVoyageSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                SingletonStore.shared.currentVoyage = self.tableViewController.voyagesViewModel.get(voyageAt: indexPath.row)
            }
//            else {
//                print("elsePrepare")
//            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.shouldGoToNextScreen{
            self.shouldGoToNextScreen = false
            self.performSegue(withIdentifier: "showDetailsVoyageSegue", sender: self)
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        print("hello add action")
       //  performSegue(withIdentifier: "addNewVoyageSegue", sender: self)
    }

    //-------------------------------------------------------------------------------------------------
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destController = segue.destination as? PersonDetailsViewController {
            if let cell = sender as? UITableViewCell{
               guard let indexPath = self.tableView.indexPath(for: cell) else{
                    return
                }
                destController.person = self.tableViewController.personsViewModel.get(personAt: indexPath.row)
            }

        } }
    */
    // segue ViewControllerB -> ViewController
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        print("this was called")
        print(sender.source)
        if sender.source is NewVoyageViewController {
            //print(newVoyageController.newVoyage)
            //dataRecieved = sourceViewController.dataPassed
            if sender.identifier == "exitByConfirmFromNewVoyage" {
                if let voyage = SingletonStore.shared.currentVoyage {
                    print("before")
                    self.tableViewController.voyagesViewModel.add(voyage: voyage)
                    print("after")
                    self.shouldGoToNextScreen = true
                    //performSegue(withIdentifier: "showDetailsVoyageSegue", sender: self)
                    print("retour")
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
