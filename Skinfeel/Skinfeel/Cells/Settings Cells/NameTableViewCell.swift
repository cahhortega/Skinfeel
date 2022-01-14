//
//  NameTableViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    @IBOutlet var labelName: UILabel!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.name.isUserInteractionEnabled = true
        self.name.text = UserDefaults.standard.string(forKey: "name") ?? ""

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

