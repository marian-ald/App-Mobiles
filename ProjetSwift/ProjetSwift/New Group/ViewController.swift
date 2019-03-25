//
//  ViewController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableViewController: PersonsTableViewController!
    
    @IBOutlet weak var label: UILabel!
    //@IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.tableViewController = PersonsTableViewController(tableView: self.tableView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addAction(_ sender: Any) {
        let cf: Person
        let df = DateFormatter()
        df.dateFormat = "dd-mm-yyyy"
        if df.date(from: "01-06-1988") != nil{
            cf = Person(firstname: "Christophe", lastname: "Fiorio", startDate : Date(), stopDate : Date())
        }
        else{
            cf = Person(firstname: "Christophe", lastname: "Fiorio", startDate : Date(), stopDate : Date())
        }
        self.tableViewController.personsViewModel.add(person: cf)
        //self.tableView.reloadData()
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
    
    // segue ViewControllerB -> ViewController
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let newPersonController = sender.source as? NewPersonViewController {
            //dataRecieved = sourceViewController.dataPassed
            if let person = newPersonController.newPerson{
                self.tableViewController.personsViewModel.add(person: person)
            } }
    }
  */
 }
