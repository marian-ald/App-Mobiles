//
//  BilanTableTableViewController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class BilanTableViewController: NSObject, UITableViewDataSource, TransferSetViewModelDelegate {
    
    func dataSetChanged() {
        self.tableView.reloadData()
    }
    
    func transferDeleted(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func transferUpdated(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func transferAdded(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    

    var transfersSetViewModel : TransferSetViewModel
    var tableView   : UITableView
    let fetchResultController : TransferFetchResultController
    
    init(tableView: UITableView) {
        self.tableView        = tableView
        self.fetchResultController = TransferFetchResultController(view : tableView)
        self.transfersSetViewModel =  self.fetchResultController.transfersFetched()
        print("Got here fetchTransfers")
        super.init()
        self.tableView.dataSource      = self
    }
    

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
     }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.transfersSetViewModel.count
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bilanTransferCellId", for: indexPath) as! BilanCellController
     
        return configure(cell: cell, atIndexPath: indexPath)
     }
    
     //-------------------------------------------------------------------------------------------------
     // MARK: - convenience methods
     @discardableResult
     private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        
        print("Had to configure cell")
        if let cellB = cell as? BilanCellController {
            let transfer = self.transfersSetViewModel.get(elementAt: indexPath.row)
            cellB.payerName?.text = transfer.fullnameSender
            cellB.paidName?.text = transfer.fullnameReceiver
            cellB.amountTransfer?.text = String(transfer.sum)
            print("Costumed the cell")
        }
        return cell
     }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
     

 
}
