//
//  PopupAIApp.swift
//  PopupAI
//
//  Created by Song Allen on 2025/6/21.
//

import SwiftUI

@main
struct PopupAIApp: App {
    @StateObject private var accessibilityManager = AccessibilityManager()
    
    var body: some Scene {
        MenuBarExtra("PopupAI", systemImage: "brain.head.profile") {
            SettingsView()
                .environmentObject(accessibilityManager)
        }
        .menuBarExtraStyle(.window)
    }
}
