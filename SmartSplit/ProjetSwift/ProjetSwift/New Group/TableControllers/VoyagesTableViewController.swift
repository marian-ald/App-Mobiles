//
//  VoyagesTableView.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 22/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreGraphics

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
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0,width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoyageCellId", for: indexPath) as! VoyageCellController
        // Configure the cell...
        if let voyage = self.voyagesViewModel.get(voyageAt: indexPath.item) {
        //cell.nameVoyage.text = self.voyagesViewModel.get(voyageAt: indexPath.item)?.name
            
            if let image = UIImage(data: voyage.image!) {
                
                cell.voyageImage.image = resizeImage(image: image, targetSize: CGSize(width: 60.0, height: 60.0))
                
                //cell.voyageImage.transform = CGAffineTransform(scaleX: 1, y: -1)
            }
            cell.nameVoyage.text = voyage.name
            cell.voyageImage.setRounded()
            
            //cell.layer.borderWidth = 15.0
            //cell.layer.borderColor = UIColor.white.cgColor
        }
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
            //cell.textLabel?.text = voyage.name + "new App"
        }
        return cell
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

