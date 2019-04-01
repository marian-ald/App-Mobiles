//
//  TransfersTableViewController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class TransfersTableViewController: NSObject, UITableViewDataSource, TransferSetViewModelDelegate {

    
    var transferViewModel : TransferSetViewModel
    var tableView   : UITableView
    
    let fetchResultController : TransferFetchResultController
    
    
    init(tableView: UITableView) {
        self.tableView        = tableView
        
        self.fetchResultController = TransferFetchResultController(view : tableView)
        self.transferViewModel = TransferSetViewModel(data: self.fetchResultController.transfersFetched)
        
        super.init()
        self.tableView.dataSource      = self
        self.transferViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.transferViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransferCellId", for: indexPath) as! TransferCellController
        // Configure the cell...
      //>>>>  cell.nameTransfer.text = self.transfersViewModel.get(transferAt: indexPath.item)?.name
        cell.namePayer.text = self.transferViewModel.get(transferAt: indexPath.item)?.sentBy?.fullname
        cell.namePayer.text = self.transferViewModel.get(transferAt: indexPath.item)?.receivedBy?.fullname
        
        let amountTransfer = self.transferViewModel.get(transferAt: indexPath.item)?.amountTransfer
        cell.transferAmount.text = "\(String(describing: amountTransfer))"
        
        return configure(cell: cell, atIndexPath: indexPath)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TransferSetViewModelDelegate
    //-------------------------------------------------------------------------------------------------
    // MARK: - TransferSetViewModelDelegate
    /// called when set globally changes
    func dataSetChanged(){
        self.tableView.reloadData()
    }
    /// called when a Transfer is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func transferDeleted(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Transfer is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func transferUpdated(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Transfer is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func transferAdded(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        if let transfer = self.transferViewModel.get(transferAt: indexPath.row){
            // cell.textLabel?.text = self.presenter.text(ofTransfer: transfer)
         //>>>>   cell.textLabel?.text = transfer.name + "new App"
        }
        return cell
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

