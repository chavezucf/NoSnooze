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

    let onboardingData: [(title: String, imageName: String, description: String)] = [
        ("Rise and Shine with NoSnooze!", "sunrise.fill", "Start your day like a champion! NoSnooze helps you break free from the snooze trap and embrace energizing mornings. Welcome to a world of productive routines and renewed enthusiasm. Let's conquer the day together!"),
        ("Personalize Your Wake-Up Ritual", "alarm.fill", "Your mornings, your way! Customize alarm with soothing sounds and inspiring titles. Wake up with purpose and positivity. Unleash your creativity and seize the day!"),
        ("Your Journey Begins Now!", "person.3.fill", "You're part of a vibrant community of achievers! NoSnooze empowers you to unlock your full potential. Embrace the challenge, seize opportunities, and build a brighter future, one morning at a time.")
    ]

    var body: some View {
        VStack(spacing: 0) { // Adjust overall vertical spacing
            HStack {
                Spacer()
                Button(action: { hasCompletedOnboarding = true }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.appBlue)
                        .padding()
                }
            }
            .padding(.top, 10) // Add top padding to the close button

            TabView(selection: $selectedIndex) {
                ForEach(onboardingData.indices, id: \.self) { index in
                    OnboardingPageView(title: onboardingData[index].title, imageName: onboardingData[index].imageName, description: onboardingData[index].description)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .padding(.bottom, 20) // Add bottom padding to the TabView

            HStack {
                Button(action: {
                    if selectedIndex > 0 { selectedIndex -= 1 }
                }) {
                    Text("Previous")
                        .foregroundColor(.appRed)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                }
                .disabled(selectedIndex == 0)

                Spacer()

                if selectedIndex == onboardingData.count - 1 {
                    Button(action: {
                        // Navigate to Home Screen
                        hasCompletedOnboarding = true
                    }) {
                        Text("Start")
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: .infinity)
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
                            .frame(maxWidth: .infinity)
                            .background(Color.appRed)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 20) // Adjust the horizontal padding
            .padding(.bottom, 10) // Add bottom padding to the buttons
        }
        .padding(.vertical, 30) // Add vertical padding to the entire view
    }
}





struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(hasCompletedOnboarding: .constant(true))
    }
}
