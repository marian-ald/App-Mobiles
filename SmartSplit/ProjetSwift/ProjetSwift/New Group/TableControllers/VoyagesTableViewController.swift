//
//  VoyagesTableView.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit

class VoyagesTableViewController: NSObject, UITableViewDataSource, VoyageSetViewModelDelegate {

    
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

    // Swipe actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        print("Is this callllllleeeeddd ????")
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [edit, delete])
    }
    
    func editAction(at indexPath: IndexPath) -> UIContextualAction {
        // grab the voyage and edit it
        let action = UIContextualAction(style: .normal, title: "Edit"){(action, view, completion)in
            let voyage = self.voyagesViewModel.get(voyageAt: indexPath.row)
            print("Numele selectat la swipeEdit")
            print(voyage?.name)
            
            completion(true)
        }
        action.backgroundColor = .blue
        return action
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Delete"){ (action, view, completion) in
            let voyage = self.voyagesViewModel.get(voyageAt: indexPath.row)
            // self.voyagesViewModel.delete(voyage) // not yet, trb sa verific ca ia ce trebuie
            print("Numele selectat la swipeDel")
            print(voyage?.name)
            
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
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

