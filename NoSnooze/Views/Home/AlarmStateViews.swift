//
//  AlarmStates.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct NoAlarmStateView: View {
    @ObservedObject var viewModel: AlarmViewModel

    var body: some View {
        VStack {
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

struct AlarmSetStateView: View {
    @ObservedObject var viewModel: AlarmViewModel
    let alarm: Alarm

    var body: some View {
        var alarmLabel = alarm.label != nil ? "Alarm Set: " + alarm.label! : "Alarm Set"
        VStack {
            Text(alarmLabel)
                .font(.largeTitle)
            Text("Alarm Time: \(alarm.time, formatter: dateFormatter)")
                .font(.title2)
            Button(action: {
                viewModel.presentSetAlarmView = true
            }) {
                Text("Edit")
            }
            .sheet(isPresented: $viewModel.presentSetAlarmView) {
                SetAlarmView(viewModel: viewModel, alarmToEdit: alarm)
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

struct PostAlarmStateView: View {
    let postAlarmDate: Date

    var body: some View {
        VStack {
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

struct AlarmGoingOffStateView: View {
    @ObservedObject var viewModel: AlarmViewModel
    let alarm: Alarm

    var body: some View {
        VStack {
            Image(systemName: "clock") // Change to your clock image
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 50) 
            Button(action: {
                viewModel.removeAlarm(alarm)
                SoundManager.shared.stopSound()
            }) {
                Text("Turn Off Alarm")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.appRed)
                    .cornerRadius(10)
            }
            .padding(.top, 50)
        }
    }
}



struct AlarmStates_Previews: PreviewProvider {
    static var now = Date()
    static var sound = TempData.sounds[0]
    static var alarm = Alarm(id: UUID(), time: now, sound: sound, isActive: true, label: "Test")
    //static var alarmState = AlarmState.noAlarm
    //static var alarmState = AlarmState.alarmSet(alarm)
    //static var alarmState = AlarmState.postAlarm(now)
    static var alarmState = AlarmState.alarmGoingOff(alarm)
    
    static var previews: some View {
        Group {
            switch alarmState {
            case .noAlarm:
                NoAlarmStateView(viewModel: AlarmViewModel())
            case .alarmSet(let alarm):
                AlarmSetStateView(viewModel: AlarmViewModel(), alarm: alarm)
            case .postAlarm( _):
                PostAlarmStateView(postAlarmDate: Date())
            case .alarmGoingOff(let alarm):
                AlarmGoingOffStateView(viewModel: AlarmViewModel(), alarm: alarm)
            }
        }
    }
}

