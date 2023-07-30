//
//  TempData.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import Foundation

struct TempData {
    
    static let sounds: [Sound] = [
        Sound(id: UUID(), idName: "funSound", name: "Fun Sound", filename: "sound1"),
        Sound(id: UUID(), idName: "loudSound", name: "Loud Sound", filename: "sound2"),
        Sound(id: UUID(), idName: "party", name: "Party", filename: "sound3")
    ]
    static let alarm: Alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(60), sound: sounds[0], isActive: true)
    static let editAlarm: Alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(120), sound: sounds[2], isActive: true)
}
