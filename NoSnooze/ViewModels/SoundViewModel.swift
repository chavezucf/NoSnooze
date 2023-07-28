//
//  SoundViewModel.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation
class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound]
    
    init(sounds: [Sound]) {
        self.sounds = sounds
    }
    
    // other methods for loading, selecting sounds
}
