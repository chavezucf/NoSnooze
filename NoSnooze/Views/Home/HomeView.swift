//
//  HomeView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: AlarmViewModel
    @State private var isAlarmViewActive = false // to present SetAlarmView
    @State private var isHelpViewActive = false // to push HelpSupportView
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.alarmState {
                case .noAlarm:
                    NoAlarmStateView(viewModel: viewModel)
                case .alarmSet(let alarm):
                    AlarmSetStateView(viewModel: viewModel, alarm: alarm)
                case .postAlarm(let date):
                    PostAlarmStateView(postAlarmDate: date)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isHelpViewActive = true
                    }) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    .fullScreenCover(isPresented: $isHelpViewActive) {
                        HelpSupportView()
                    }
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AlarmViewModel()
        viewModel.addAlarm(Alarm(id: UUID(), time: Date().addingTimeInterval(60), sound: Sound(id: UUID(), name: "Sound 1", filename: "sound1"), isActive: true))
        return HomeView(viewModel: viewModel)
    }
}
