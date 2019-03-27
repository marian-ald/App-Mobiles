//
//  PersonTableViewController.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit


class PersonsTableViewController: NSObject, UITableViewDataSource, PersonSetViewModelDelegate {
    //    var presenter   : PersonPresenter
    var tableView   : UITableView
    var personsViewModel : PersonSetViewModel

    
    let fetchResultController : PersonFetchResultController
    init(tableView: UITableView) {
        self.tableView        = tableView
//        self.presenter        = SimplePersonPresenter()
//       self.fetchResultController = PersonFetchResultController(view : tableView)

        
        self.fetchResultController = PersonFetchResultController(view : tableView)
        self.personsViewModel = PersonSetViewModel(data: self.fetchResultController.personsFetched)
//        self.personsViewModel = PersonSetViewModel(data : tableView)//, model : self.personsViewModel)
        super.init()
        self.tableView.dataSource      = self
        self.personsViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.personsViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellId", for: indexPath)
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
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        
        if let person = self.personsViewModel.get(personAt: indexPath.row){
            // cell.textLabel?.text = self.presenter.text(ofPerson: person)
            cell.textLabel?.text = person.pfirstname
        }
        
        return cell
    }
}
