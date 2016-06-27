//
//  ViewControllerTableViewCell.swift
//  EarthquakeAssignment
//
//  Created by Marius Skalstad on 27.06.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
