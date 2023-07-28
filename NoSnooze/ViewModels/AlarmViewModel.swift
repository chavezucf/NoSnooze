//
//  AlarmViewModel.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

enum AlarmState {
    case noAlarm
    case alarmSet(Alarm)
    case postAlarm(Date)
}


class AlarmViewModel: ObservableObject {
    @Published var alarms = [Alarm]() // Collection of alarms
    @Published var nextAlarm: Alarm? // The next alarm to ring
    @Published var alarmState: AlarmState = .noAlarm
    @Published var presentSetAlarmView:Bool = false
    
    // Adds new alarm to the list and updates the nextAlarm
    func addAlarm(_ alarm: Alarm) {
        alarms.append(alarm)
        alarmState = .alarmSet(alarm)
        updateNextAlarm()
    }
    
    // Removes alarm from the list and updates the nextAlarm
    func removeAlarm(_ alarm: Alarm) {
        if let index = alarms.firstIndex(where: {$0.id == alarm.id}) {
            alarms.remove(at: index)
            alarmState = .noAlarm
            updateNextAlarm()
        }
    }
    
    // Updates the nextAlarm property
    private func updateNextAlarm() {
        nextAlarm = alarms.min(by: {$0.time < $1.time})
    }
}
