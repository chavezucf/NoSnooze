//
//  OnboardingPageView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct OnboardingPageView: View {
    var title: String
    var imageName: String // Name of the SF Symbol
    var description: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName) // Set the SF Symbol here
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120) // Adjust the size of the image
                .foregroundColor(Color.appBlue)

            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.appOrange)
                .multilineTextAlignment(.center)

            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 30) // Adjust the horizontal padding

            Spacer()
        }
        .padding() // Add overall padding to the entire view
    }
}


struct OnboardingPageView_Previews: PreviewProvider {
    static let example = (
        title: "Welcome",
        imageName: "sunrise.fill",
        description: "Discover a new way of setting alarms. Simple, intuitive, and easy to use."
    )

    static var previews: some View {
        OnboardingPageView(title: example.title, imageName: example.imageName, description: example.description)
    }
}
