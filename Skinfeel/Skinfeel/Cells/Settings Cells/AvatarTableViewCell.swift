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
    @IBOutlet var boy1: UIButton!
    @IBOutlet var boy2: UIButton!
    @IBOutlet var boy3: UIButton!
    @IBOutlet var boy4: UIButton!
    @IBOutlet var boys: UIStackView!
    
    var defaults = UserDefaults.standard
    var selectedAvatar = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        switch defaults.string(forKey: "profileImage") {
        case "girl1-profile":
            clickAvatar(iconSelected: girl1, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        case "girl2-profile":
            clickAvatar(iconSelected: girl2, icon2: girl1, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        case "girl3-profile":
            clickAvatar(iconSelected: girl3, icon2: girl2, icon3: girl1, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        case "girl4-profile":
            clickAvatar(iconSelected: girl4, icon2: girl2, icon3: girl3, icon4: girl1, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        case "boy1-profile":
            clickAvatar(iconSelected: boy1, icon2: girl2, icon3: girl3, icon4: girl4, icon5: girl1, icon6: boy2, icon7: boy3, icon8: boy4)
        case "boy2-profile":
            clickAvatar(iconSelected: boy2, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: girl1, icon7: boy3, icon8: boy4)
        case "boy3-profile":
            clickAvatar(iconSelected: boy3, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy4, icon8: girl1)
        case "boy4-profile":
            clickAvatar(iconSelected: boy4, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: girl1)
        
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
        
        boy1.translatesAutoresizingMaskIntoConstraints = false
        boy1.addTarget(self, action: #selector(clickBoy1), for: .touchUpInside)
        
        boy2.translatesAutoresizingMaskIntoConstraints = false
        boy2.addTarget(self, action: #selector(clickBoy2), for: .touchUpInside)
        
        boy3.translatesAutoresizingMaskIntoConstraints = false
        boy3.addTarget(self, action: #selector(clickBoy3), for: .touchUpInside)
        
        boy4.translatesAutoresizingMaskIntoConstraints = false
        boy4.addTarget(self, action: #selector(clickBoy4), for: .touchUpInside)
        
    }
    
    @objc func clickAvatar(iconSelected: UIButton, icon2: UIButton, icon3: UIButton, icon4: UIButton, icon5: UIButton, icon6: UIButton, icon7: UIButton, icon8: UIButton) {
        
        if selectedAvatar == false {
            iconSelected.layer.borderWidth = 3
            iconSelected.layer.borderColor = UIColor(named: "Rosa")?.cgColor
            iconSelected.layer.cornerRadius = 35
            icon2.alpha = 0.5
            icon3.alpha = 0.5
            icon4.alpha = 0.5
            icon5.alpha = 0.5
            icon6.alpha = 0.5
            icon7.alpha = 0.5
            icon8.alpha = 0.5
            selectedAvatar = true
            
        } else {
            iconSelected.alpha = 1
            iconSelected.layer.borderWidth = 3
            iconSelected.layer.borderColor = UIColor(named: "Rosa")?.cgColor
            iconSelected.layer.cornerRadius = 35
            
            resetDesign(icon: icon2)
            resetDesign(icon: icon3)
            resetDesign(icon: icon4)
            resetDesign(icon: icon5)
            resetDesign(icon: icon6)
            resetDesign(icon: icon7)
            resetDesign(icon: icon8)
            
        }

    }
    
    func resetDesign(icon: UIButton){
        icon.alpha = 0.5
        icon.layer.borderWidth = 0
        icon.layer.borderColor = UIColor(named: "Bg")?.cgColor
    }
    
    @objc func clickGirl1(){
        clickAvatar(iconSelected: girl1, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        defaults.set("girl1-profile", forKey: "profileImage")
    }
    @objc func clickGirl2(){
        clickAvatar(iconSelected: girl2, icon2: girl1, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        defaults.set("girl2-profile", forKey: "profileImage")
    }
    @objc func clickGirl3(){
        clickAvatar(iconSelected: girl3, icon2: girl2, icon3: girl1, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        defaults.set("girl3-profile", forKey: "profileImage")
    }
    @objc func clickGirl4(){
        clickAvatar(iconSelected: girl4, icon2: girl2, icon3: girl3, icon4: girl1, icon5: boy1, icon6: boy2, icon7: boy3, icon8: boy4)
        defaults.set("girl4-profile", forKey: "profileImage")
    }
    
    @objc func clickBoy1(){
        clickAvatar(iconSelected: boy1, icon2: girl2, icon3: girl3, icon4: girl4, icon5: girl1, icon6: boy2, icon7: boy3, icon8: boy4)
        defaults.set("boy1-profile", forKey: "profileImage")
    }
    @objc func clickBoy2(){
        clickAvatar(iconSelected: boy2, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: girl1, icon7: boy3, icon8: boy4)
        defaults.set("boy2-profile", forKey: "profileImage")
    }
    @objc func clickBoy3(){
        clickAvatar(iconSelected: boy3, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: girl1, icon8: boy4)
        defaults.set("boy3-profile", forKey: "profileImage")
    }
    @objc func clickBoy4(){
        clickAvatar(iconSelected: boy4, icon2: girl2, icon3: girl3, icon4: girl4, icon5: boy1, icon6: boy2, icon7: boy3, icon8: girl1)
        defaults.set("boy4-profile", forKey: "profileImage")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

