//
//  SplashScreenView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 8/4/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @Binding var showLaunchScreen: Bool
    var body: some View {
        ZStack {
            Color("appRed") // replace this with your actual color name
                .ignoresSafeArea() // to make the color go edge to edge

            VStack {
                Spacer()
                Image("LaunchImage") // replace this with your actual image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("NoSnooze")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showLaunchScreen = false
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView(showLaunchScreen: .constant(true))
    }
}
