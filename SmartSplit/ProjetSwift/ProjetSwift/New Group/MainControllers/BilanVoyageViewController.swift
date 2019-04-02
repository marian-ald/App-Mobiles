//
//  BilanVoyageViewController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class BilanVoyageViewController: UIViewController {
    
    var tableViewController: BilanTableViewController!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewController = BilanTableViewController(tableView: self.tableView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
