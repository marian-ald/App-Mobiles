//
//  DepensesMainController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class DepensesMainController: UIViewController {
    
    var tableViewController: DepensesTableViewController!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableViewController = DepensesTableViewController(tableView: self.tableView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditDepenseFromList" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                SingletonStore.shared.currentDepense = self.tableViewController.depensesViewModel.get(depenseAt: indexPath.row)
            }
        }
    }

}
