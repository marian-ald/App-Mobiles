//
//  NewViewController.swift
//  TP1
//
//  Created by Marian ALDESCU on 18/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var selectedCell: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // let pers = (UIApplication.shared.delegate as? AppDelegate)?.indexedPers
        // let myIndex = (UIApplication.shared.delegate as? AppDelegate)?.myIndex
        // selectedCell.text = pers[myIndex].fullname()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
