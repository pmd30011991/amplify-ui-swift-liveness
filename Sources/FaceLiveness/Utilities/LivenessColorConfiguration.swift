//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// ColorConfiguration.swift

import SwiftUI

struct LivenessColorConfiguration {
    // Primary colors
    var primaryBackground: (light: String, dark: String)
    var primaryLabel: (light: String, dark: String)
    
    // General colors
    var background: (light: String, dark: String)
    var label: (light: String, dark: String)
    
    // Error states
    var errorBackground: (light: String, dark: String)
    var errorLabel: (light: String, dark: String)
    
    // Warning states
    var warningBackground: (light: String, dark: String)
    var warningLabel: (light: String, dark: String)
    
    // Preview
    var previewBorder: (light: String, dark: String)
    
    static let `default` = LivenessColorConfiguration(
        primaryBackground: (light: "#047D95", dark: "#7DD6E8"),
        primaryLabel: (light: "#FFFFFF", dark: "#0D1926"),
        background: (light: "#FFFFFF", dark: "#0D1926"),
        label: (light: "#000000", dark: "#FFFFFF"),
        errorBackground: (light: "#950404", dark: "#EF8F8F"),
        errorLabel: (light: "#FFFFFF", dark: "#000000"),
        warningBackground: (light: "#B8CEF9", dark: "#663300"),
        warningLabel: (light: "#002266", dark: "#EFBF8F"),
        previewBorder: (light: "#AEB3B7", dark: "#FFFFFF")
    )
}

// Environment key for color configuration
struct LivenessColorConfigurationKey: EnvironmentKey {
    static let defaultValue = LivenessColorConfiguration.default
}

extension EnvironmentValues {
    var livenessColors: LivenessColorConfiguration {
        get { self[LivenessColorConfigurationKey.self] }
        set { self[LivenessColorConfigurationKey.self] = newValue }
    }
}

// Color extension using the configuration
extension Color {
    static func dynamicColors(light: Color, dark: Color) -> Color {
        #if os(iOS)
        return Color(uiColor: UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(dark)
            default:
                return UIColor(light)
            }
        })
        #else
        return light
        #endif
    }
    
    static func hex(_ hex: String) -> Color {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        return Color(.sRGB,
                    red: Double(r) / 255,
                    green: Double(g) / 255,
                    blue: Double(b) / 255,
                    opacity: Double(a) / 255)
    }
}

// Extension to use the environment configuration
extension Color {
    @Environment(\.livenessColors) static var configuration
    
    static var livenessPrimaryBackground: Color {
        dynamicColors(
            light: .hex(configuration.primaryBackground.light),
            dark: .hex(configuration.primaryBackground.dark)
        )
    }
    
    static var livenessPrimaryLabel: Color {
        dynamicColors(
            light: .hex(configuration.primaryLabel.light),
            dark: .hex(configuration.primaryLabel.dark)
        )
    }
    
    static var livenessBackground: Color {
        dynamicColors(
            light: .hex(configuration.background.light),
            dark: .hex(configuration.background.dark)
        )
    }
    
    static var livenessLabel: Color {
        dynamicColors(
            light: .hex(configuration.label.light),
            dark: .hex(configuration.label.dark)
        )
    }
    
    static var livenessErrorBackground: Color {
        dynamicColors(
            light: .hex(configuration.errorBackground.light),
            dark: .hex(configuration.errorBackground.dark)
        )
    }
    
    static var livenessErrorLabel: Color {
        dynamicColors(
            light: .hex(configuration.errorLabel.light),
            dark: .hex(configuration.errorLabel.dark)
        )
    }
    
    static var livenessWarningBackground: Color {
        dynamicColors(
            light: .hex(configuration.warningBackground.light),
            dark: .hex(configuration.warningBackground.dark)
        )
    }
    
    static var livenessWarningLabel: Color {
        dynamicColors(
            light: .hex(configuration.warningLabel.light),
            dark: .hex(configuration.warningLabel.dark)
        )
    }
    
    static var livenessPreviewBorder: Color {
        dynamicColors(
            light: .hex(configuration.previewBorder.light),
            dark: .hex(configuration.previewBorder.dark)
        )
    }
}
