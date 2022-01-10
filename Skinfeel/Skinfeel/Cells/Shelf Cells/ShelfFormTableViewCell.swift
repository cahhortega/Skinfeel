//
//  ShelfFormTableViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

//Célula usada no FORMULÁRIO

import UIKit

class ShelfFormTableViewCell: UITableViewCell {
    @IBOutlet var nomeProduto: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}



