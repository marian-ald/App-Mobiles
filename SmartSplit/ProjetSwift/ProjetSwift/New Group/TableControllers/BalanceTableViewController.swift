//
//  BalanceTableViewController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/3/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class BalanceTableViewController: NSObject, UITableViewDataSource//, VoyageSetViewModelDelegate
{
    var tableView   : UITableView
    var balancesViewModel : BalanceItemSetViewModel
    
    
    let fetchResultController : BalanceFetchResultController
    init(tableView: UITableView) {
        self.tableView        = tableView
        self.fetchResultController = BalanceFetchResultController(view: tableView)
        self.balancesViewModel = self.fetchResultController.balancesFetched()
        
        super.init()
        self.tableView.dataSource      = self
        //self.depensesViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.balancesViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "balanceCellId", for: indexPath)
        // Configure the cell...
        return configure(cell: cell, atIndexPath: indexPath)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - DepenseSetViewModelDelegate
    //-------------------------------------------------------------------------------------------------
    // MARK: - DepenseSetViewModelDelegate
    /// called when set globally changes
    func dataSetChanged(){
        self.tableView.reloadData()
    }
    /// called when a Depense is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func depenseDeleted(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Depense is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func depenseUpdated(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Depense is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func depenseAdded(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        
        if let depense = self.balancesViewModel.getByIndex(elementAt: indexPath.row), let cellB = cell as? BalanceCellController {
            // cell.textLabel?.text = self.presenter.text(ofDepense: depense)
            cellB.fullNamePayer?.text = depense.0
            cellB.sumDifference?.text = String(depense.1)
            if depense.1 < 0 {
                cellB.sumDifference?.backgroundColor = .red
            }
            else {
                cellB.sumDifference?.backgroundColor = .green
            }
        }
        
        return cell
    }

}
