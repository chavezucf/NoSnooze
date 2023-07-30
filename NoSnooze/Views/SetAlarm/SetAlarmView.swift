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

    init(viewModel: AlarmViewModel, alarmToEdit: Alarm? = nil) {
        self.viewModel = viewModel
        _alarmDate = State(initialValue: alarmToEdit?.time ?? Date())
        _alarmSound = State(initialValue: alarmToEdit?.sound ?? TempData.sounds.last!)
        self.alarmToEdit = alarmToEdit
    }
    
    var body: some View {
        VStack {
            SetAlarmHeaderView(alarmToEdit: alarmToEdit)
            SelectDateView(alarmDate: $alarmDate)
            SelectSoundView(alarmSound: $alarmSound)
            SetAlarmButtonView(viewModel: viewModel, alarmDate: alarmDate, alarmSound: alarmSound, alarmToEdit: alarmToEdit)
        }
        .highPriorityGesture(DragGesture().onEnded { _ in
            presentationMode.wrappedValue.dismiss()
        })
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
