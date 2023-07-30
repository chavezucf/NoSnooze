//
//  SoundManager.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation
import AVFoundation

class SoundManager {
    
    // Singleton instance
    static let shared = SoundManager()
    
    var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func playSound(sound: String, type: String = "wav") {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            } catch {
                print("Couldn't find the audio file")
            }
        }
    }
    
    
    func stopSound() {
        audioPlayer?.stop()
    }
}
