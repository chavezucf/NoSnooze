//
//  Alarm.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

struct Alarm: Identifiable  {
    var id: UUID
    var time: Date
    var sound: Sound
    var isActive: Bool
    var label: String?
}
