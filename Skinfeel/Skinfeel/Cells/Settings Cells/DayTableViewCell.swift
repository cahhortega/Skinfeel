//
//  DayTableViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    @IBOutlet var labelDay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
