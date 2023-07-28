//
//  AlarmSettingView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct SetAlarmView: View {
    @ObservedObject var viewModel: AlarmViewModel
    @State private var alarmDate = Date()
    @State private var alarmSound = Sound(id: UUID(), name: "Sound 1", filename: "sound1")
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Alarm date picker
            DatePicker("Select Alarm Time", selection: $alarmDate, displayedComponents: [.hourAndMinute])
            
            // Sound picker goes here...
            
            Button("Save") {
                // Save alarm
                let newAlarm = Alarm(id: UUID(), time: alarmDate, sound: alarmSound, isActive: true)
                viewModel.addAlarm(newAlarm)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .highPriorityGesture(DragGesture()
            .onEnded { _ in
                presentationMode.wrappedValue.dismiss()
            })
    }
}

//struct AlarmSettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetAlarmView()
//    }
//}
