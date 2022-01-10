//
//  AvatarTableViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    @IBOutlet var girl1: UIButton!
    @IBOutlet var girl2: UIButton!
    @IBOutlet var girl3: UIButton!
    @IBOutlet var girl4: UIButton!
    @IBOutlet var girls: UIStackView!
    var defaults = UserDefaults.standard
    var selectedAvatar = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        switch defaults.string(forKey: "profileImage") {
        case "girl1-profile":
            clickAvatar(girlSelected: girl1, girl2: girl2, girl3: girl3, girl4: girl4)
        case "girl2-profile":
            clickAvatar(girlSelected: girl2, girl2: girl1, girl3: girl3, girl4: girl4)
        case "girl3-profile":
            clickAvatar(girlSelected: girl3, girl2: girl2, girl3: girl1, girl4: girl4)
        case "girl4-profile":
            clickAvatar(girlSelected: girl4, girl2: girl2, girl3: girl3, girl4: girl1)
        default:
            print("oi")
        }
        
        girl1.translatesAutoresizingMaskIntoConstraints = false
        girl1.addTarget(self, action: #selector(clickGirl1), for: .touchUpInside)
        
        girl2.translatesAutoresizingMaskIntoConstraints = false
        girl2.addTarget(self, action: #selector(clickGirl2), for: .touchUpInside)
        
        girl3.translatesAutoresizingMaskIntoConstraints = false
        girl3.addTarget(self, action: #selector(clickGirl3), for: .touchUpInside)
        
        girl4.translatesAutoresizingMaskIntoConstraints = false
        girl4.addTarget(self, action: #selector(clickGirl4), for: .touchUpInside)
        
        
        
    }
    
    @objc func clickAvatar(girlSelected: UIButton, girl2: UIButton, girl3: UIButton, girl4: UIButton) {
        
        if selectedAvatar == false {
            girlSelected.layer.borderWidth = 3
            girlSelected.layer.borderColor = UIColor(named: "Rosa")?.cgColor
            girlSelected.layer.cornerRadius = 35
            girl2.alpha = 0.5
            girl3.alpha = 0.5
            girl4.alpha = 0.5
            selectedAvatar = true
        } else {
            girlSelected.alpha = 1
            girlSelected.layer.borderWidth = 3
            girlSelected.layer.borderColor = UIColor(named: "Rosa")?.cgColor
            girlSelected.layer.cornerRadius = 35
            
            resetDesign(girl: girl2)
            resetDesign(girl: girl3)
            resetDesign(girl: girl4)
            
        }

    }
    
    func resetDesign(girl: UIButton){
        girl.alpha = 0.5
        girl.layer.borderWidth = 0
        girl.layer.borderColor = UIColor(named: "Bg")?.cgColor
    }
    
    @objc func clickGirl1(){
        clickAvatar(girlSelected: girl1, girl2: girl2, girl3: girl3, girl4: girl4)
        defaults.set("girl1-profile", forKey: "profileImage")
    }
    @objc func clickGirl2(){
        clickAvatar(girlSelected: girl2, girl2: girl1, girl3: girl3, girl4: girl4)
        defaults.set("girl2-profile", forKey: "profileImage")
    }
    @objc func clickGirl3(){
        clickAvatar(girlSelected: girl3, girl2: girl2, girl3: girl1, girl4: girl4)
        defaults.set("girl3-profile", forKey: "profileImage")
    }
    @objc func clickGirl4(){
        clickAvatar(girlSelected: girl4, girl2: girl2, girl3: girl3, girl4: girl1)
        defaults.set("girl4-profile", forKey: "profileImage")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

