//
//  DepensesTableController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class DepensesTableViewController:NSObject, UITableViewDataSource, DepenseSetViewModelDelegate {
    var tableView   : UITableView
    var depensesViewModel : DepenseSetViewModel
    
    
    let fetchResultController : DepenseForVoyageFetchResultController
    init(tableView: UITableView) {
        self.tableView        = tableView
        self.fetchResultController = DepenseForVoyageFetchResultController(view : tableView)
        self.depensesViewModel = DepenseSetViewModel(data:
            self.fetchResultController.depensesFetched)
        
        super.init()
        self.tableView.dataSource      = self
        self.depensesViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.depensesViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "depenseCellId", for: indexPath)
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
        
        if let depense = self.depensesViewModel.get(depenseAt: indexPath.row){
            // cell.textLabel?.text = self.presenter.text(ofDepense: depense)
            cell.textLabel?.text = depense.nameD
        }
        
        return cell
    }
}

