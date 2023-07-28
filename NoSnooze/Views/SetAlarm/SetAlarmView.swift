//
//  AlarmSettingView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct SetAlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // Your Alarm Setting content here...
            
            Button("Save") {
                // Save alarm and dismiss view
                presentationMode.wrappedValue.dismiss()
            }
        }
        .highPriorityGesture(DragGesture()
            .onEnded { _ in
                presentationMode.wrappedValue.dismiss()
            })
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        SetAlarmView()
    }
}
