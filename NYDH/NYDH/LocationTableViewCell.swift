//
//  LocationTableViewCell.swift
//  NYDH
//
//  Created by Marcel Chaucer on 9/7/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var boroughLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
