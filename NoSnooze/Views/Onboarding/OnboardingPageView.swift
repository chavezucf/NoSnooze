//
//  OnboardingPageView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct OnboardingPageView: View {
    var title: String
    var image: String
    var description: String

    var body: some View {
        VStack {
            Image(systemName: image) // use your custom image name here
                .resizable()
                .scaledToFit()
                .foregroundColor(.appRed)
                .font(Font.title.weight(.ultraLight))
                .padding(100)

            Text(title)
                .font(.largeTitle)
                .foregroundColor(.appRed)

            Text(description)
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
        .background(Color.appDarkBlack)
        .cornerRadius(10)
        .padding()
    }
}


struct OnboardingPageView_Previews: PreviewProvider {
    static let onboardingData: [(title: String, image: String, description: String)] = [
            ("Welcome", "book", "Discover a new way of setting alarms. Simple, intuitive, and easy to use."),
            ("Customize", "clock", "Set your alarms with customized sounds."),
            ("Get Started", "location.north", "Get started now! Your perfect alarm setting experience is just a touch away.")
        ]
    static let example = onboardingData[2]
    static var previews: some View {
        OnboardingPageView(title: example.title, image: example.image, description: example.description)
    }
}
