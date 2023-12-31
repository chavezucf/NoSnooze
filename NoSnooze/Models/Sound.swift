//
//  Sound.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

struct Sound: Identifiable, Hashable {
    var id: UUID
    var name: String
    var filename: String
}
