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
    @State private var alarmLabel: String
    @Environment(\.presentationMode) var presentationMode
    var alarmToEdit: Alarm?
    
    init(viewModel: AlarmViewModel, alarmToEdit: Alarm? = nil) {
        self.viewModel = viewModel
        _alarmDate = State(initialValue: alarmToEdit?.time ?? Date())
        _alarmSound = State(initialValue: alarmToEdit?.sound ?? TempData.sounds.last!)
        _alarmLabel = State(initialValue: alarmToEdit?.label ?? "")
        self.alarmToEdit = alarmToEdit
    }
    
    var body: some View {
        NavigationView {
            Form {
                SelectDateView(alarmDate: $alarmDate)
                SelectOptionsView(alarmLabel: $alarmLabel, alarmSound: $alarmSound)
                DeleteButtonView(viewModel: viewModel, alarmToEdit: alarmToEdit)
            }
            .onAppear{
                SoundManager.shared.stopSound()
            }
            .onDisappear {
                SoundManager.shared.stopSound()
            }
            .navigationBarTitle(Text(alarmToEdit == nil ? "Set Alarm" : "Edit Alarm"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            },
                trailing:
                                    Button(action: saveAlarm) {
                Text("Save")
            }
            )
            
        }.accentColor(.appBlue)
    }
    
    func saveAlarm() {
        presentationMode.wrappedValue.dismiss()
        let newAlarm = Alarm(id: UUID(), time: alarmDate, sound: alarmSound, isActive: true, label: alarmLabel)
        if let alarmToEdit = alarmToEdit {
            viewModel.updateAlarm(alarmToEdit, with: newAlarm)
        } else {
            viewModel.addAlarm(newAlarm)
        }
    }
}


struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        let alarm = TempData.alarm
        let viewModel = AlarmViewModel()
        viewModel.addAlarm(alarm)
        let alarmToEdit = TempData.editAlarm
        return SetAlarmView(viewModel: viewModel, alarmToEdit: alarmToEdit)
    }
}
