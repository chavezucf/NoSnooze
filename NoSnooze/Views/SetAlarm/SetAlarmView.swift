//
//  AlarmSettingView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct SetAlarmView: View {
    @ObservedObject var viewModel: AlarmViewModel
    @State private var alarmDate: Date
    @State private var alarmSound: Sound
    @Environment(\.presentationMode) var presentationMode
    var alarmToEdit: Alarm?

    var body: some View {
        VStack {
            
            Capsule()
                .fill(Color.secondary)
                .frame(width: 40, height: 3)
                .padding(10)
            Text(alarmToEdit == nil ? "Set Alarm" : "Edit Alarm")
                .font(.largeTitle)
                .foregroundColor(.appRed)
                .padding(.top, 30)
            VStack {
                Text("Time")
                    .font(.title3)
                DatePicker("", selection: $alarmDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .accentColor(.appRed)
            }
            .frame(maxWidth: .infinity)
            .padding(20)

            VStack {
                Text("Sound")
                Picker("Select Sound", selection: $alarmSound.name) {
                    Text("Fun Sound").tag("funSound")
                    Text("Loud Sound").tag("loudSound")
                    Text("Party").tag("party")
                }
                .pickerStyle(WheelPickerStyle())
                .accentColor(Color.appRed)
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(20)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
                let newAlarm = Alarm(id: UUID(), time: alarmDate, sound: alarmSound, isActive: true)
                if let alarmToEdit = alarmToEdit {
                    viewModel.updateAlarm(alarmToEdit, with: newAlarm)
                } else {
                    viewModel.addAlarm(newAlarm)
                }
            }) {
                Text("Save")
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appRed)
                    .cornerRadius(15)
            }
            .padding(.bottom, alarmToEdit == nil ? 30 : 0)

            if alarmToEdit != nil {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    if let alarmToEdit = alarmToEdit {
                        viewModel.removeAlarm(alarmToEdit)
                    }
                }) {
                    Text("Delete")
                        .foregroundColor(Color.appRed)
                        .padding()
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
            }
        }
        .highPriorityGesture(DragGesture().onEnded { _ in
            presentationMode.wrappedValue.dismiss()
        })
    }

    // Initialize state variables based on whether a new alarm is being created or an existing one is being edited.
    init(viewModel: AlarmViewModel, alarmToEdit: Alarm? = nil) {
        self.viewModel = viewModel
        _alarmDate = State(initialValue: alarmToEdit?.time ?? Date())
        _alarmSound = State(initialValue: alarmToEdit?.sound ?? Sound(id: UUID(), name: "Sound 1", filename: "sound1"))
        self.alarmToEdit = alarmToEdit
    }
}



struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        let alarm = Alarm(id: UUID(), time: Date().addingTimeInterval(60), sound: Sound(id: UUID(), name: "Sound 1", filename: "sound1"), isActive: true)
        let viewModel = AlarmViewModel()
        viewModel.addAlarm(alarm)
        return SetAlarmView(viewModel: viewModel, alarmToEdit: alarm)
    }
}
