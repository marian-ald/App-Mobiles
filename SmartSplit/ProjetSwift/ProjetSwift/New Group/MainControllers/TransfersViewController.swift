//
//  TransfersViewController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class TransfersViewController: UIViewController {

    //@IBOutlet weak var TransfersTableViewController: UITableView!

    @IBOutlet weak var tableView: UITableView!
    var tableViewController : TransfersTableViewController!

    
    @IBAction func triePar(_ sender: Any) {
    }
    
    @IBAction func paye(_ sender: Any) {
    }
    
    @IBAction func payeur(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableViewController = TransfersTableViewController(tableView: self.tableView)
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
