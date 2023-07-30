//
//  SetAlarmFormView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/29/23.
//

import SwiftUI

struct SelectDateView: View {
    @Binding var alarmDate: Date
    var body: some View {
        Section(header: Text("Time")) {
            DatePicker("", selection: $alarmDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .accentColor(.appRed)
        }
        
    }
}


struct SelectSoundView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView(alarmDate: .constant(Date()))
    }
}
