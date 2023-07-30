//
//  NotificationManager.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    private init() { }
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    
    func scheduleNotification(title: String, body: String, timeInterval: TimeInterval, soundName: String, type: String = "wav") {
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let soundFile = soundName + "." + type
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: soundFile))
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    func removeAllNotifications(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

}
