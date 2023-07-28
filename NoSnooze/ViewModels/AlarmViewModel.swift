//
//  AlarmViewModel.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

class AlarmViewModel: ObservableObject {
    @Published var alarms: [Alarm]
    
    init(alarms: [Alarm]) {
        self.alarms = alarms
    }
    
    // other methods for creating, editing, deleting alarms
}
