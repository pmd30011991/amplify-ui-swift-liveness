//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

struct RecordingButton: View {
    @EnvironmentObject private var colors: LivenessColors
    var body: some View {
        VStack(alignment: .center) {
            Circle()
                .foregroundColor(.hex("#F92626"))
                .frame(width: 17, height: 17)
            Text(LocalizedStrings.challenge_recording_indicator_label)
                .font(.system(size: 12))
                .fontWeight(.bold)
        }
        .padding([.top, .bottom], 12)
        .padding([.leading, .trailing], 8)
        .background(colors.livenessBackground)
        .cornerRadius(8)
    }
}

struct RecordingButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            RecordingButton()
        }
    }
}
