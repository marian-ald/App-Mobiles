//
//  TableViewController.swift
//  TP1v2
//
//  Created by Theodora-Augustina DRAGAN on 19/03/2019.
//  Copyright © 2019 Theodora-Augustina DRAGAN. All rights reserved.
//
import UIKit
import Foundation

class TableViewController : UITableView {

    let pers = (UIApplication.shared.delegate as? AppDelegate)?.indexedPers
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pers!.myIndexedSet.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCellId", for: indexPath)
        // cell.textLabel?.text = pers[indexPath.row].fullname()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        // get cell label
        //let cell = tableView.cellForRow(at: indexPath as IndexPath)
        
        (UIApplication.shared.delegate as? AppDelegate)?.myIndex = indexPath.row
        // performSegue(withIdentifier: "segue", sender: self)
    }
    
    @IBAction func addPerson(_ sender: Any) {
        // performSegue(withIdentifier: "segueAddPerson", sender: self)
    }

}
