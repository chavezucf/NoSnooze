//
//  AlarmStates.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct NoAlarmState: View {
    @ObservedObject var viewModel: AlarmViewModel

    var body: some View {
        VStack {
            // Your UI elements here...
            Button(action: {
                viewModel.presentSetAlarmView = true
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .sheet(isPresented: $viewModel.presentSetAlarmView) {
                SetAlarmView(viewModel: viewModel)
            }
            Text("No Alarm")
                .font(.largeTitle)
                .padding(.top, 20)
        }
    }
}

struct AlarmSetState: View {
    @ObservedObject var viewModel: AlarmViewModel
    let alarm: Alarm

    var body: some View {
        VStack {
            // Your UI elements here...
            Text("Alarm Set")
                .font(.largeTitle)
            Text("Alarm Time: \(alarm.time, formatter: dateFormatter)")
                .font(.title2)
            Button(action: {
                viewModel.presentSetAlarmView = true
            }) {
                Text("Edit")
            }
            .sheet(isPresented: $viewModel.presentSetAlarmView) {
                SetAlarmView(viewModel: viewModel)
            }
            .padding(.top, 20)
        }
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
}

struct PostAlarmState: View {
    let postAlarmDate: Date

    var body: some View {
        VStack {
            // Your UI elements here...
            Text("Post Alarm")
                .font(.largeTitle)
            Text("Next Alarm can be set after: \(postAlarmDate, formatter: dateFormatter)")
                .font(.title2)
            TimerView(targetDate: Date(timeInterval: 6 * 60 * 60, since: postAlarmDate))
                .padding(.top, 20)
        }
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
}


struct AlarmStates_Previews: PreviewProvider {
    static var now = Date()
    static var alarm = Alarm(id: UUID(), time: now, sound: Sound(id: UUID(), name: "Morning", filename: "File"), isActive: true)
    static var alarmState = AlarmState.noAlarm
    //static var alarmState = AlarmState.alarmSet(alarm)
    //static var alarmState = AlarmState.postAlarm(now)
    
    static var previews: some View {
        Group {
            switch alarmState {
            case .noAlarm:
                NoAlarmState(viewModel: AlarmViewModel())
            case .alarmSet(let alarm):
                AlarmSetState(viewModel: AlarmViewModel(), alarm: alarm)
            case .postAlarm( _):
                PostAlarmState(postAlarmDate: Date())
            }
        }
    }
}

