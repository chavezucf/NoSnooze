//
//  HelpSupportView.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import SwiftUI

struct HelpSupportView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Your Help and Support content here...

            Button("Back") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct HelpSupportView_Previews: PreviewProvider {
    static var previews: some View {
        HelpSupportView()
    }
}
