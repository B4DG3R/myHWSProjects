//
//  TableViewCell.swift
//  Project4
//
//  Created by Matthew Hollyhead on 07/08/2020.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var websiteTitleLabel: UILabel!
    
    func setLabel(website: Website) {
        
        websiteTitleLabel.text = website.url
        
    }
    
    

}
