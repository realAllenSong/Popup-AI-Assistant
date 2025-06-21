//
//  AccessibilityManager.swift
//  PopupAI
//
//  Created by Song Allen on 2025/6/21.
//

import Foundation
import AppKit

final class AccessibilityManager: ObservableObject {
    @Published var isGranted: Bool = false
    
    init() {
        checkPermission()
    }
    
    private func checkPermission() {
        DispatchQueue.main.async {
            self.isGranted = AXIsProcessTrusted()
        }
    }
    
    func requestPermission() {
        let options: NSDictionary = [
            kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true
        ]
        let result = AXIsProcessTrustedWithOptions(options)
        
        DispatchQueue.main.async {
            self.isGranted = result
        }
    }
    
    func openPrivacySettings() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
            NSWorkspace.shared.open(url)
        }
    }
    
    func refreshPermissionStatus() {
        checkPermission()
    }
} 