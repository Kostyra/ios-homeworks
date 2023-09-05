

import UIKit
import UserNotifications

class LocalNotificationsService {
    
    
    //MARK: - Prorepties
    
    let center = UNUserNotificationCenter.current()
    
    //MARK: - Method
    
    func registeForLatestUpdatesIfPossible() {
        center.requestAuthorization(options: [.badge, .alert, .sound, .provisional]) { (success, error) in
            if success {
                self.scheduleDailyNotification()
            }
        }
    }
        
        func  scheduleDailyNotification() {
            let uid = UUID().uuidString
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.body = "Body"
            content.sound = .default
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
            var dateComponents = DateComponents()
            dateComponents.hour = 19
            //dateComponents.minute = 14
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(identifier: uid, content: content, trigger: trigger)
            center.add(request)
        }
    
}
