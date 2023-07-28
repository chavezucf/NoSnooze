//
//  HomeView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isAlarmViewActive = false // to present SetAlarmView
    @State private var isHelpViewActive = false // to push HelpSupportView

    var body: some View {
        VStack {
            // Your home screen content here...

            Button("Add/Edit Alarm") {
                isAlarmViewActive = true
            }
            .sheet(isPresented: $isAlarmViewActive) {
                SetAlarmView()
            }

            Button("Help & Support") {
                isHelpViewActive = true
            }
            .fullScreenCover(isPresented: $isHelpViewActive) {
                HelpSupportView()
            }
        }
        .onAppear {
            // Check if alarm is active, if yes, present AlarmActiveView
            // This requires your alarm logic and is not shown here.
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
