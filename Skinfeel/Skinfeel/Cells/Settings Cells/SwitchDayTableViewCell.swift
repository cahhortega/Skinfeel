//
//  SwitchDayTableViewCell.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//


import UIKit
import UserNotifications

class SwitchDayTableViewCell: UITableViewCell {
    @IBOutlet var labelDay: UILabel!
    @IBOutlet var switchDay: UISwitch!
    var notificationId: NotificationIdentifier = .Morning
    var defaults = UserDefaults.standard
    
    
    func setup(notificationId: NotificationIdentifier){
        self.notificationId = notificationId
        switchDay.isOn = defaults.bool(forKey: notificationId.rawValue)
        switch notificationId {
        case .Morning:
            labelDay.text = "Manhã".localized()
        case .Afternoon:
            labelDay.text = "Tarde".localized()
        case .Night:
            labelDay.text = "Noite".localized()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //        UNUserNotificationCenter.current().delegate = self
        self.switchDay.addTarget(self, action: #selector(stateChanged(switchState:)), for: .valueChanged)
        // Initialization code
    }
    
    //Switch
    @objc func stateChanged(switchState: UISwitch) {
        NotificationManager.shared.changeNotificationStatus(notificationId: self.notificationId, isEnabled: switchState.isOn)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



