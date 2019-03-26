//
//  VoyagesTableView.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class VoyagesTableViewController: NSObject, UITableViewDataSource, VoyageSetViewModelDelegate {

    var tableView   : UITableView
    var voyagesViewModel : VoyageSetViewModel

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoyageCellId", for: indexPath)
        // Configure the cell...
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
            cell.textLabel?.text = voyage.nameVoyage
        }
        return cell
        
    }
}

