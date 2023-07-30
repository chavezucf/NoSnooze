//
//  TempData.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import Foundation

struct TempData {
    
    static let sounds: [Sound] = [
        Sound(id: UUID(), name: "Classic", filename: "ClassicAlarm"),
        Sound(id: UUID(), name: "Game Wave", filename: "GameWaveAlarm"),
        Sound(id: UUID(), name: "Retro Game", filename: "RetroGame")
    ]
    static let alarm: Alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(60), sound: sounds[0], isActive: true)
    static let editAlarm: Alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(120), sound: sounds[0], isActive: true)
}
