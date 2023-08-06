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
        Sound(id: UUID(), name: "Retro Game", filename: "RetroGame"),
        Sound(id: UUID(), name: "Car Alarm", filename: "CarAlarm"),
        Sound(id: UUID(), name: "Alarm Medley", filename: "AlarmMashup"),
        Sound(id: UUID(), name: "Space Machine", filename: "RetroGame"),
        Sound(id: UUID(), name: "Marching Alarm", filename: "MarchingAlarm"),
        Sound(id: UUID(), name: "Trumpet", filename: "TrumpetAlarm"),
        Sound(id: UUID(), name: "Ferry Horn", filename: "FerryHorn"),
        Sound(id: UUID(), name: "Military Trumpet", filename: "MilitaryTrumpetReveille"),
        Sound(id: UUID(), name: "Native Drums", filename: "DrumAlarm"),
        Sound(id: UUID(), name: "Phone Alarm", filename: "AlarmClockBell"),
        Sound(id: UUID(), name: "Alien Alarm", filename: "AlienAlarm"),
        Sound(id: UUID(), name: "Military Alarm", filename: "MilitaryAlarm"),
        Sound(id: UUID(), name: "Futuristic", filename: "FuturisticAlarm"),
        Sound(id: UUID(), name: "Euro Alarm", filename: "EuroAlarm"),
        Sound(id: UUID(), name: "Fire Alarm", filename: "FireAlarm"),
        Sound(id: UUID(), name: "Electronic", filename: "ElectronicAlarm")

    ]
    static let alarm: Alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(60), sound: sounds[0], isActive: true)
    static let editAlarm: Alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(120), sound: sounds[0], isActive: true)
}
