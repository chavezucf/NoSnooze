//
//  SetAlarmButtonView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import SwiftUI

struct SetAlarmButtonView: View {
    @ObservedObject var viewModel: AlarmViewModel
    var alarmDate: Date
    var alarmSound: Sound
    @Environment(\.presentationMode) var presentationMode
    @State var alarmToEdit: Alarm?
    
    func saveAlarm() {
        presentationMode.wrappedValue.dismiss()
        let newAlarm = Alarm(id: UUID(), time: alarmDate, sound: alarmSound, isActive: true)
        if let alarmToEdit = alarmToEdit {
            viewModel.updateAlarm(alarmToEdit, with: newAlarm)
        } else {
            viewModel.addAlarm(newAlarm)
        }
    }
    
    func deleteAlarm() {
        presentationMode.wrappedValue.dismiss()
        if let alarmToEdit = alarmToEdit {
            viewModel.removeAlarm(alarmToEdit)
        }
    }
    
    var body: some View {
        VStack{
            Button(action: saveAlarm) {
                Text("Save")
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appRed)
                    .cornerRadius(15)
            }
            .padding(.bottom, alarmToEdit == nil ? 30 : 0)
            
            if alarmToEdit != nil {
                Button(action: deleteAlarm) {
                    Text("Delete")
                        .foregroundColor(Color.appRed)
                        .padding()
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct SetAlarmButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date().addingTimeInterval(60)
        let sound = TempData.sounds[0]
        let alarm = TempData.alarm
        let viewModel = AlarmViewModel()
        viewModel.addAlarm(alarm)
        return SetAlarmButtonView(viewModel: viewModel, alarmDate: date, alarmSound: sound, alarmToEdit: alarm)
    }
}
