//
//  AlarmActiveView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct AlarmActiveView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Your Alarm Active content here...
            
            Button("Stop") {
                // Stop alarm and dismiss view
                presentationMode.wrappedValue.dismiss()
            }
        }
        .highPriorityGesture(DragGesture()
            .onEnded { _ in
                presentationMode.wrappedValue.dismiss()
            })
    }
}

struct AlarmActiveView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmActiveView()
    }
}
