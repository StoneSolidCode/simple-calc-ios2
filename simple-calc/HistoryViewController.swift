//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by iguest on 10/22/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    var historyData = ""
    @IBOutlet weak var historyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        historyLabel.text = historyData
        historyLabel.sizeToFit()
    }
    
    
    
    @IBAction func btnReturn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
