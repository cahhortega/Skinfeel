//
//  NotificationManager.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    let center = UNUserNotificationCenter.current()
    var defaults = UserDefaults.standard
    
    
    private override init() {
        super.init()
        center.delegate = self
    }
    
    func registerCategories() {
        let show = UNNotificationAction(identifier: "show", title: "Vamos lá!".localized(), options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        center.setNotificationCategories([category])
    }
    
    @objc func registroLocalNotifications() {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    func changeNotificationStatus(notificationId: NotificationIdentifier, isEnabled: Bool) {
        defaults.set(isEnabled, forKey: notificationId.rawValue)
        if isEnabled {
            registerNotification(identifier: notificationId)
        } else {
            self.center.removePendingNotificationRequests(withIdentifiers: [notificationId.rawValue])
            
        }
        
    }
    
    @objc func createLocalNotification(title: String, body: String, hour: Int, min: Int, identifier: String) {
        registerCategories()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = NotificationCategory.Alarm.rawValue
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = min
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // pull out the buried userInfo dictionary
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                print("Default identifier")
                
            case "show":
                // the user tapped our "show more info…" button
                print("Show more information…")
                
            default:
                break
            }
        }
        completionHandler()
    }
    
    func registerNotification(identifier: NotificationIdentifier){
        let nome = defaults.string(forKey: "name") ?? ""
        switch (identifier) {
        case .Morning: createLocalNotification(title: "🧖‍♀️ \("Bom dia,".localized()) \(nome)!",
                                               body: "Que tal começar o seu dia iniciando sua rotina de cuidados com a pele?".localized(),
                                               hour: defaults.integer(forKey: NotificationPicker.MorningHour.rawValue),
                                               min: defaults.integer(forKey:NotificationPicker.MorningMin.rawValue),
                                               identifier: NotificationIdentifier.Morning.rawValue)
        case .Afternoon: createLocalNotification(title: "🌤 \("Boa tarde,".localized()) \(nome)!",
                                                 body: "Não se esqueça de reforçar a proteção da sua pele.".localized(),
                                                 hour: defaults.integer(forKey: NotificationPicker.AfternoonHour.rawValue),
                                                 min: defaults.integer(forKey: NotificationPicker.AfternoonMin.rawValue),
                                                 identifier: NotificationIdentifier.Afternoon.rawValue)
        case .Night: createLocalNotification(title: "🌙 \("Boa noite,".localized()) \(nome)!",
                                             body: "Vamos finalizar o dia cuidando da sua pele?".localized(),
                                             hour: defaults.integer(forKey: NotificationPicker.NightHour.rawValue),
                                             min: defaults.integer(forKey: NotificationPicker.NightMin.rawValue),
                                             identifier: NotificationIdentifier.Night.rawValue)
        }
    }
}

