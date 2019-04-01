//
//  DepenseMainController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class DepenseMainController: UIViewController {
        
    @IBOutlet weak var titleLabel: UILabel!
    var tableViewController: PayerTableViewController!
        
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            self.tableViewController = PayerTableViewController(tableView: self.tableView)
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
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
