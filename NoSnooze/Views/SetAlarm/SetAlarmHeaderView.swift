//
//  SetAlarmHeaderView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/30/23.
//

import SwiftUI

struct SetAlarmHeaderView: View {
    @State var alarmToEdit: Alarm?
    var body: some View {
        VStack{
            Capsule()
                .fill(Color.secondary)
                .frame(width: 40, height: 3)
                .padding(10)
            Text(alarmToEdit == nil ? "Set Alarm" : "Edit Alarm")
                .font(.largeTitle)
                .foregroundColor(.appRed)
                .padding(.top, 30)
        }
    }
}

struct SetAlarmHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SetAlarmHeaderView()
    }
}
