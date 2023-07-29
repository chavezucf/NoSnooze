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
    @Published var alarms = [Alarm]()
    @Published var nextAlarm: Alarm?
    @Published var alarmState: AlarmState = .noAlarm
    @Published var presentSetAlarmView:Bool = false
    
    func addAlarm(_ alarm: Alarm) {
        alarms.append(alarm)
        alarmState = .alarmSet(alarm)
        updateNextAlarm()
    }
    
    func removeAlarm(_ alarm: Alarm) {
        if let index = alarms.firstIndex(where: {$0.id == alarm.id}) {
            alarms.remove(at: index)
            alarmState = .noAlarm
            updateNextAlarm()
        }
    }
    
    func updateAlarm(_ alarm: Alarm, with newAlarm: Alarm) {
        if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
            // Replace the existing alarm with the new one
            alarms[index] = newAlarm
            alarmState = .alarmSet(newAlarm)
            updateNextAlarm()
        }
    }
    
    private func updateNextAlarm() {
        nextAlarm = alarms.min(by: {$0.time < $1.time})
    }
}
