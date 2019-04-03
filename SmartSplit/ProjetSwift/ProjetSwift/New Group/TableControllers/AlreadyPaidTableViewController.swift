//
//  AlreadyPaidTableViewController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class AlreadyPaidTableViewController: NSObject, UITableViewDataSource//, PayerSetViewModelDelegate
{
    var depenseName : String
    var tableView   : UITableView
    var payersSetViewModel : PayerSetViewModel
    let fetchResultController : PayersForDepenseFetchResultController
    
    
    init(tableView: UITableView, depenseName: String) {
        self.tableView        = tableView
        self.fetchResultController = PayersForDepenseFetchResultController(view : tableView, depenseName: depenseName)
        self.payersSetViewModel = self.fetchResultController.fetchPlayers()
        self.depenseName = depenseName
        super.init()
        
        self.tableView.dataSource      = self
        //self.payersSetViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.payersSetViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlreadyPaidCellId", for: indexPath)
        
        // Configure the cell...
        return configure(cell: cell, atIndexPath: indexPath)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - PersonSetViewModelDelegate
    //-------------------------------------------------------------------------------------------------
    // MARK: - PersonSetViewModelDelegate
    /// called when set globally changes
    func dataSetChanged(){
        self.tableView.reloadData()
    }
    /*
    /// called when a Person is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personDeleted(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personUpdated(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personAdded(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }*/
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        
        if let payer = self.payersSetViewModel.get(payerAt: indexPath.row), let cellP = cell as? PayerCellController {
            cellP.personFullname?.text = payer.fullNamePayer
            cellP.amount?.text = String(payer.sumPaid)
            cellP.isBeneficiary?.isOn = payer.isBeneficiary
        }
        
        return cell
    }
}
