//
//  RoutineCollectionViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class RoutineCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var morningCircularProgress: CircularProgressBarView!
    @IBOutlet weak var afternoonCircularProgress: CircularProgressBarView!
    @IBOutlet weak var nightCircularProgress: CircularProgressBarView!
    var isInEditingMode: Bool = false {
        didSet {
            checkmarkLabel.isHidden = !isInEditingMode
        }
    }
    @IBOutlet var checkmarkLabel: UILabel!
    var iconeDeletar = UIImage(systemName: "checkmark.circle.fill")

    @IBOutlet var nameRoutine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet {
            if isInEditingMode {
                checkmarkLabel.text = isSelected ? "✓" : ""
                checkmarkLabel.backgroundColor = isSelected ? UIColor(named: "Apagar") : .clear
                checkmarkLabel.layer.masksToBounds = true
                checkmarkLabel.layer.cornerRadius = isSelected ? 15 : 15
                checkmarkLabel.layer.borderColor = isSelected ? UIColor.white.cgColor : UIColor.clear.cgColor
                checkmarkLabel.layer.borderWidth = isSelected ? 1.5 : 0
                
            }
        }
    }
    



}
