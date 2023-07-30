//
//  SetAlarmButtonView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import SwiftUI

struct DeleteButtonView: View {
    @ObservedObject var viewModel: AlarmViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var alarmToEdit: Alarm?
    func deleteAlarm() {
        presentationMode.wrappedValue.dismiss()
        if let alarmToEdit = alarmToEdit {
            viewModel.removeAlarm(alarmToEdit)
        }
    }
    
    var body: some View {
        if alarmToEdit != nil {
            Section {
                Button(action: deleteAlarm) {
                    Text("Delete")
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.appRed)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct SetAlarmButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let alarm = TempData.alarm
        let viewModel = AlarmViewModel()
        viewModel.addAlarm(alarm)
        return DeleteButtonView(viewModel: viewModel, alarmToEdit: alarm)
    }
}
