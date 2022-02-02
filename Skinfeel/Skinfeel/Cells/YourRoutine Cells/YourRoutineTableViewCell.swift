//
//  YourRoutineTableViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class YourRoutineTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.selectionStyle = .none
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

//        override func setSelected(_ selected: Bool, animated: Bool) {
//            super.setSelected(selected, animated: animated)
//            self.accessoryType = selected ? .checkmark : .none
//        }
//    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
