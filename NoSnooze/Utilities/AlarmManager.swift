//
//  AlarmManager.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

protocol AlarmManagerDelegate: AnyObject {
    func alarmDidGoOff(_ alarm: Alarm)
}

class AlarmManager {
    weak var delegate: AlarmManagerDelegate?
    static let shared = AlarmManager()
    private init() { }

    func scheduleAlarm(_ alarm: Alarm, isReplace: Bool = false) {
        if(isReplace){
            NotificationManager.shared.removeAllNotifications()
        }
        
        let alarmTime: Date = alarm.time
        let now = Date()
        let calendar = Calendar.current
        
        let currentNow = Date()
        let nowRounded = calendar.date(bySetting: .second, value: 0, of: currentNow)!
        let alarmTimeRounded = calendar.date(bySetting: .second, value: 0, of: alarmTime)!
        let components = calendar.dateComponents([.second], from: nowRounded, to: alarmTimeRounded)

        NotificationManager.shared.scheduleNotification(title: "Alarm", body: "Your alarm is ringing!", timeInterval: TimeInterval(components.second!), soundName: alarm.sound.filename)

        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(components.second!)) {
            self.delegate?.alarmDidGoOff(alarm)
            SoundManager.shared.playSound(alarm.sound.filename)
        }
    }

    func removeAlarm() {
        NotificationManager.shared.removeAllNotifications()
        SoundManager.shared.stopSound() // New
    }
}

