//
//  NoSnoozeApp.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

@main
struct NoSnoozeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark) // Force dark mode
                .accentColor(.red) // Set default button color
        }
    }
}
