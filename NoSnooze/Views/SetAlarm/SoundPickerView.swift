//
//  SoundPickerView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import SwiftUI
struct SoundPickerView: View {
    @Binding var selectedSound: Sound
    @State private var activeSound: Sound?
    
    init(selectedSound: Binding<Sound>) {
        self._selectedSound = selectedSound
        self._activeSound = State(initialValue: selectedSound.wrappedValue)
    }

    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(), count: 2)) {
                ForEach(TempData.sounds) { sound in
                    SoundCell(sound: sound, isActive: sound == activeSound)
                        .onTapGesture {
                            if activeSound != sound {
                                SoundManager.shared.stopSound()
                            }
                            activeSound = sound
                            selectedSound = sound
                        }
                }
            }
        }
        .padding(10)
        .onDisappear {
            activeSound = nil
            SoundManager.shared.stopSound()
        }
    }
}

struct SoundCell: View {
    let sound: Sound
    let isActive: Bool
    
    @ObservedObject var soundManager = SoundManager.shared
    
    var body: some View {
        VStack {
            Text(sound.name)
                .frame(maxWidth: .infinity, minHeight: 200)
                .background(isActive ? Color.appRed : Color.gray)
                .overlay(
                    Button(action: soundManager.togglePlayback) {
                        Image(systemName: soundManager.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 16)
                    .padding(.trailing, 16)
                    .opacity(isActive ? 1 : 0)
                    .animation(.easeIn, value: isActive),
                    alignment: .bottomTrailing
                )
        }
        .onChange(of: isActive) { isActive in
            if isActive {
                // Only play the sound if this cell becomes active
                soundManager.playSound(sound.filename)
            }
        }
    }
}




struct SoundPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let sound = TempData.sounds[0]
        SoundPickerView(selectedSound: .constant(sound))
    }
}
