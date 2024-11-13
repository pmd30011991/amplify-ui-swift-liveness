//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// ColorConfiguration.swift

import SwiftUI

public struct LivenessColorConfiguration {
    // Make properties public
    public var primaryBackground: (light: String, dark: String)
    public var primaryLabel: (light: String, dark: String)
    public var background: (light: String, dark: String)
    public var label: (light: String, dark: String)
    public var errorBackground: (light: String, dark: String)
    public var errorLabel: (light: String, dark: String)
    public var warningBackground: (light: String, dark: String)
    public var warningLabel: (light: String, dark: String)
    public var previewBorder: (light: String, dark: String)
    
    // Make initializer public
    public init(
        primaryBackground: (light: String, dark: String),
        primaryLabel: (light: String, dark: String),
        background: (light: String, dark: String),
        label: (light: String, dark: String),
        errorBackground: (light: String, dark: String),
        errorLabel: (light: String, dark: String),
        warningBackground: (light: String, dark: String),
        warningLabel: (light: String, dark: String),
        previewBorder: (light: String, dark: String)
    ) {
        self.primaryBackground = primaryBackground
        self.primaryLabel = primaryLabel
        self.background = background
        self.label = label
        self.errorBackground = errorBackground
        self.errorLabel = errorLabel
        self.warningBackground = warningBackground
        self.warningLabel = warningLabel
        self.previewBorder = previewBorder
    }
    
    public static let `default` = LivenessColorConfiguration(
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
