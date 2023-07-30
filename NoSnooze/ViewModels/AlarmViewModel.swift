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
        AlarmManager.shared.scheduleAlarm(alarm)
    }
    
    func removeAlarm(_ alarm: Alarm) {
        if let index = alarms.firstIndex(where: {$0.id == alarm.id}) {
            alarms.remove(at: index)
            alarmState = .noAlarm
            updateNextAlarm()
            AlarmManager.shared.removeAlarm()
        }
    }
    
    func updateAlarm(_ alarm: Alarm, with newAlarm: Alarm) {
        if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
            alarms[index] = newAlarm
            alarmState = .alarmSet(newAlarm)
            updateNextAlarm()
            AlarmManager.shared.scheduleAlarm(newAlarm, isReplace: true)
        }
    }
    
    private func updateNextAlarm() {
        nextAlarm = alarms.min(by: {$0.time < $1.time})
    }
}
