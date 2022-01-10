//
//  YourDayViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class YourDayViewController: UIViewController {
    @IBOutlet var pickerMorning: UIDatePicker!
    @IBOutlet var pickerAfternoon: UIDatePicker!
    @IBOutlet var pickerNight: UIDatePicker!
    @IBOutlet weak var progressView: UIProgressView!
    var defaults = UserDefaults.standard
    // Create Date Formatter
    let dateFormatterHour = DateFormatter()
    let dateFormatterMin = DateFormatter()
    
    override func viewDidDisappear(_ animated: Bool) {
        //Pegando os valores dos pickers
        let morningHour = dateFormatterHour.string(from: pickerMorning.date)
        let morningMin = dateFormatterMin.string(from: pickerMorning.date)
        let afternoonHour = dateFormatterHour.string(from: pickerAfternoon.date)
        let afternoonMin = dateFormatterMin.string(from: pickerAfternoon.date)
        let nightHour = dateFormatterHour.string(from: pickerNight.date)
        let nightMin = dateFormatterMin.string(from: pickerNight.date)
        
        //Cadastrando os horários em UserDefaults
        defaults.setValue(Int(morningHour)!, forKey: NotificationPicker.MorningHour.rawValue)
        defaults.setValue(Int(morningMin)!, forKey: NotificationPicker.MorningMin.rawValue)

        defaults.setValue(Int(afternoonHour)!, forKey: NotificationPicker.AfternoonHour.rawValue)
        defaults.setValue(Int(afternoonMin)!, forKey: NotificationPicker.AfternoonMin.rawValue)

        defaults.setValue(Int(nightHour)!, forKey: NotificationPicker.NightHour.rawValue)
        defaults.setValue(Int(nightMin)!, forKey: NotificationPicker.NightMin.rawValue)

        
        print("manha:",defaults.string(forKey: NotificationPicker.MorningHour.rawValue)!,defaults.string(forKey: NotificationPicker.MorningMin.rawValue)!,
              "tarde:",defaults.string(forKey: NotificationPicker.AfternoonHour.rawValue)!,defaults.string(forKey: NotificationPicker.AfternoonMin.rawValue)!,
              "noite:",defaults.string(forKey: NotificationPicker.NightHour.rawValue)!,defaults.string(forKey: NotificationPicker.NightMin.rawValue)!)
       
        //Configurando as notificações iniciais
        defaults.set(true, forKey: NotificationIdentifier.Morning.rawValue)
        defaults.set(true, forKey: NotificationIdentifier.Afternoon.rawValue)
        defaults.set(true, forKey: NotificationIdentifier.Night.rawValue)
        
        
        NotificationManager.shared.changeNotificationStatus(notificationId: .Morning, isEnabled: true)
        NotificationManager.shared.changeNotificationStatus(notificationId: .Afternoon, isEnabled: true)
        NotificationManager.shared.changeNotificationStatus(notificationId: .Night, isEnabled: true)


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 1
        dateFormatterHour.dateFormat = "HH"
        dateFormatterMin.dateFormat = "mm"
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")

        //navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(back)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")
    }
    
    //Ação do backButton
    @objc func back(){

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "shelf") as! ShelfFormViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
