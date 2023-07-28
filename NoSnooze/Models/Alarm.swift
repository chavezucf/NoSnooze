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

let tempAlarms: [Alarm] = [
    Alarm(id: UUID(), time: Date().addingTimeInterval(60*60), sound: Sound(id: UUID(), name: "Sound 1", filename: "sound1"), isActive: true),
    Alarm(id: UUID(), time: Date().addingTimeInterval(60*60*2), sound: Sound(id: UUID(), name: "Sound 2", filename: "sound2"), isActive: true),
    Alarm(id: UUID(), time: Date().addingTimeInterval(60*60*3), sound: Sound(id: UUID(), name: "Sound 3", filename: "sound3"), isActive: false),
    Alarm(id: UUID(), time: Date().addingTimeInterval(60*60*4), sound: Sound(id: UUID(), name: "Sound 4", filename: "sound4"), isActive: true),
    Alarm(id: UUID(), time: Date().addingTimeInterval(60*60*5), sound: Sound(id: UUID(), name: "Sound 5", filename: "sound5"), isActive: false),
]
