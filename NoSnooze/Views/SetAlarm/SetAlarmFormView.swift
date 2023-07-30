//
//  SetAlarmFormView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/29/23.
//

import SwiftUI

struct SelectSoundView: View {
    @Binding var alarmSound: Sound
    var body: some View {
        VStack {
            Text("Sound")
            Picker("Select Sound", selection: $alarmSound) {
                ForEach(TempData.sounds){ sound in
                    Text(sound.name).tag(sound)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .accentColor(Color.appRed)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .padding(20)
    }
}

struct SelectDateView: View {
    @Binding var alarmDate: Date
    var body: some View {
        VStack {
            Text("Time")
                .font(.title3)
            DatePicker("", selection: $alarmDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .accentColor(.appRed)
                .onChange(of: alarmDate) { newValue in
                    alarmDate = newValue.makeDateWithZeroSeconds()
                }
        }
        .frame(maxWidth: .infinity)
        .padding(20)

    }
}


struct SelectSoundView_Previews: PreviewProvider {
    static var previews: some View {
        let sound = TempData.sounds[2]
        SelectDateView(alarmDate: .constant(Date()))
        //SelectSoundView(alarmSound: .constant(sound))
    }
}
