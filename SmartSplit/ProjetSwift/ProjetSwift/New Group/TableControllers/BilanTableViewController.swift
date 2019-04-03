//
//  BilanTableTableViewController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class BilanTableViewController: NSObject, UITableViewDataSource {

//    var voyagesViewModel : VoyageSetViewModel
    var tableView   : UITableView
    
//    let fetchResultController : DepenseFetchResultController
    
    
    init(tableView: UITableView) {
        self.tableView        = tableView
        
//        self.fetchResultController = DepenseFetchResultController(view : tableView)
//        self.voyagesViewModel = VoyageSetViewModel(data: self.fetchResultController.voyagesFetched)
        
        super.init()
        self.tableView.dataSource      = self
//        self.voyagesViewModel.delegate = self
        calculateTransfers()
    }
    
    func calculateTransfers() {
        
    }
    
    //override func viewDidLoad() {
    //    super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    //}

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    /*
     
     
     var voyagesViewModel : VoyageSetViewModel
     var tableView   : UITableView
     
     let fetchResultController : VoyageFetchResultController
     
     
     init(tableView: UITableView) {
     self.tableView        = tableView
     
     self.fetchResultController = VoyageFetchResultController(view : tableView)
     self.voyagesViewModel = VoyageSetViewModel(data: self.fetchResultController.voyagesFetched)
     
     super.init()
     self.tableView.dataSource      = self
     self.voyagesViewModel.delegate = self
     }
     //-------------------------------------------------------------------------------------------------
     // MARK: - TableView DataSource
     func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 1
     }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return self.voyagesViewModel.count
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "VoyageCellId", for: indexPath) as! VoyageCellController
     // Configure the cell...
     cell.nameVoyage.text = self.voyagesViewModel.get(voyageAt: indexPath.item)?.name
     
     return configure(cell: cell, atIndexPath: indexPath)
     }
     //-------------------------------------------------------------------------------------------------
     // MARK: - VoyageSetViewModelDelegate
     //-------------------------------------------------------------------------------------------------
     // MARK: - VoyageSetViewModelDelegate
     /// called when set globally changes
     func dataSetChanged(){
     self.tableView.reloadData()
     }
     /// called when a Voyage is deleted from set
     ///
     /// - Parameter indexPath: (section,row) of deletion
     func voyageDeleted(at indexPath: IndexPath){
     self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
     }
     /// called when a Voyage is updated in set
     ///
     /// - Parameter indexPath: (section, row) of updating
     func voyageUpdated(at indexPath: IndexPath){
     self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
     }
     /// called when a Voyage is added to set
     ///
     /// - Parameter indexPath: (section,row) of add
     func voyageAdded(at indexPath: IndexPath){
     self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
     }
     //-------------------------------------------------------------------------------------------------
     // MARK: - convenience methods
     @discardableResult
     private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
     if let voyage = self.voyagesViewModel.get(voyageAt: indexPath.row){
     // cell.textLabel?.text = self.presenter.text(ofVoyage: voyage)
     cell.textLabel?.text = voyage.name + "new App"
     }
     return cell
     
     }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     return true
     }
     
     }
     

     */
}
