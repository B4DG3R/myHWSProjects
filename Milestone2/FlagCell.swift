//
//  FlagCell.swift
//  Milestone2
//
//  Created by Matthew Hollyhead on 31/07/2020.
//  Copyright © 2020 Matthew Hollyhead. All rights reserved.
//

import Foundation
import UIKit

class FlagCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    func setFlag(flag: Flag) {
        
        flagImageView.image = flag.image
        countryLabel.text = flag.title
        
    }
    
}


