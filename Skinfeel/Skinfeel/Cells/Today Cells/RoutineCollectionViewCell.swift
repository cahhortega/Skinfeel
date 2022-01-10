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
    
    @IBOutlet var nameRoutine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }
//    @IBAction func btn60(_ sender: Any) {
//        circularProgress.setProgress(duration: 1.0, value: 0.60)
//
//    }


}
