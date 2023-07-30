//
//  SoundManager.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation
import AVFoundation

class SoundManager: ObservableObject {
    static let shared = SoundManager()
    
    var audioPlayer: AVAudioPlayer?
    
    @Published var isPlaying: Bool = false
    
    private init() {}
    
    func playSound(_ sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else {
            print("Couldn't find the audio file")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Couldn't find the audio file")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
    }
    
    func togglePlayback() {
        if isPlaying {
            audioPlayer?.pause()
            isPlaying = false
        } else {
            audioPlayer?.play()
            isPlaying = true
        }
    }
}
