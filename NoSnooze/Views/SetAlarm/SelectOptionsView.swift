//
//  SelectOptionsView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import SwiftUI

struct SelectOptionsView: View {
    @Binding var alarmLabel: String
    @Binding var alarmSound: Sound
    var body: some View {
        Section(header: Text("Options")
            .foregroundColor(.appRed)) {
            HStack {
                Text("Label")
                Spacer()
                TextField("Alarm", text: $alarmLabel)
                    .multilineTextAlignment(.trailing)
                    .padding(.leading)
                    .onChange(of: alarmLabel) { newValue in
                        if newValue.count > 15 {
                            alarmLabel = String(newValue.prefix(15))
                        }
                    }
            }
            
            NavigationLink(destination: SoundPickerView(selectedSound: $alarmSound)) {
                HStack {
                    Text("Sound")
                    Spacer()
                    Text(alarmSound.name)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct SelectOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        let sound = TempData.sounds[0]
        SelectOptionsView(alarmLabel: .constant("Test"), alarmSound: .constant(sound))
    }
}
