//
//  AlarmRowView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct TimerView: View {
    let targetDate: Date
    @State private var now = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(timeRemaining)
            .onReceive(timer) { _ in
                now = Date()
            }
    }

    var timeRemaining: String {
        let remaining = Int(targetDate.timeIntervalSince(now))
        return remaining > 0 ? timeString(from: remaining) : "Time's up!"
    }

    func timeString(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}



//struct AlarmRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
