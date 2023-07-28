//
//  Alarm.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

struct Alarm {
    var id: UUID
    var time: Date
    var sound: Sound
    var isActive: Bool
}
