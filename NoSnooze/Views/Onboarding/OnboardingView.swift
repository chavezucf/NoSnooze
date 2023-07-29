//
//  OnboardingView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedIndex = 0
    @Binding var hasCompletedOnboarding: Bool

    let onboardingData: [(title: String, image: String, description: String)] = [
        ("Welcome", "book", "Discover a new way of setting alarms. Simple, intuitive, and easy to use."),
        ("Customize", "clock", "Set your alarms with customized sounds."),
        ("Get Started", "location.north", "Get started now! Your perfect alarm setting experience is just a touch away.")
    ]

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { hasCompletedOnboarding = true }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            TabView(selection: $selectedIndex) {
                ForEach(onboardingData.indices, id: \.self) { index in
                    OnboardingPageView(title: onboardingData[index].title, image: onboardingData[index].image, description: onboardingData[index].description)
                        .tag(index)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            HStack {
//                Button(action: {
//                    if selectedIndex > 0 { selectedIndex -= 1 }
//                }) {
//                    Text("Previous")
//                        .foregroundColor(Color.white)
//                        .padding()
//                        .background(Color.appRed)
//                        .cornerRadius(10)
//                }
//                .disabled(selectedIndex == 0)
//
//                Spacer()

                if selectedIndex == onboardingData.count - 1 {
                    Button(action: {
                        // Navigate to Home Screen
                        hasCompletedOnboarding = true
                    }) {
                        Text("Start")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.appRed)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        if selectedIndex < onboardingData.count - 1 { selectedIndex += 1 }
                    }) {
                        Text("Next")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.appRed)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .background(Color.appDarkBlack)
    }
}





struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(hasCompletedOnboarding: .constant(true))
    }
}
