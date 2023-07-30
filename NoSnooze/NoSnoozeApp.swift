//
//  NoSnoozeApp.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

@main
struct NoSnoozeApp: App {
    init() {
        NotificationManager.shared.requestNotificationAuthorization()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark) // Force dark mode
                .accentColor(.appRed) // Set default button color
        }
    }
}
