//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

struct InstructionView: View {
    @EnvironmentObject private var colors: LivenessColors
    let text: String
    let backgroundColor: Color
    var font: Font = .body
    
    var body: some View {
        Text(text)
            .foregroundColor(colors.livenessLabel)
            .font(font)
            .padding(12)
            .background(backgroundColor)
            .cornerRadius(8)
    }
}
