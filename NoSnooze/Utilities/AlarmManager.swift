//
//  AlarmManager.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

class AlarmManager {
    static let shared = AlarmManager()
    private init() { }
    func scheduleAlarm(_ alarm: Alarm, isReplace: Bool = false) {
        if(isReplace){
            NotificationManager.shared.removeAllNotifications()
        }
        let alarmTime: Date = alarm.time
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second], from: now, to: alarmTime)
        
        NotificationManager.shared.scheduleNotification(title: "Alarm", body: "Your alarm is ringing!", timeInterval: TimeInterval(components.second!), soundName: alarm.sound.filename)
    }
    func removeAlarm(){
        NotificationManager.shared.removeAllNotifications()
    }
}
