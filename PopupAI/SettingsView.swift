//
//  SettingsView.swift
//  PopupAI
//
//  Created by Song Allen on 2025/6/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var accessibilityManager: AccessibilityManager
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Image(systemName: "brain.head.profile")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
                Text("Popup AI Assistant")
                    .font(.title2)
                    .bold()
            }
            
            Divider()
            
            // Permission Status
            if accessibilityManager.isGranted {
                VStack(spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .font(.largeTitle)
                    
                    Text("辅助功能权限已授予")
                        .font(.headline)
                        .foregroundStyle(.green)
                    
                    Text("Popup AI Assistant 现在可以监测您选择的文本，并提供智能辅助功能。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Button("刷新状态") {
                        accessibilityManager.refreshPermissionStatus()
                    }
                    .buttonStyle(.bordered)
                }
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(.orange)
                        .font(.largeTitle)
                    
                    Text("需要辅助功能权限")
                        .font(.headline)
                        .foregroundStyle(.orange)
                    
                    Text("Popup AI Assistant 需要辅助功能权限来监测您选择的文本，以便在您需要时弹出快捷操作栏。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 8) {
                        Button("请求权限") {
                            accessibilityManager.requestPermission()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("打开系统设置") {
                            accessibilityManager.openPrivacySettings()
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
            
            Divider()
            
            // Settings placeholder
            VStack(spacing: 8) {
                Text("设置")
                    .font(.headline)
                
                Text("API Key 管理和其他设置功能即将上线...")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Quit button
            Button("退出应用") {
                NSApp.terminate(nil)
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.red)
        }
        .padding(20)
        .frame(width: 350, height: 500)
        .onAppear {
            accessibilityManager.refreshPermissionStatus()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AccessibilityManager())
} 