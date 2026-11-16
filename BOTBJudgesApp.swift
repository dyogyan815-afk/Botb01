// BOTBJudgesApp.swift
// BOTB Judges Edition - app entry point.
//
// First-launch authentication gates the entire UI (AuthGate).
// Tab structure: Judge submission / Multi-judge comparison / AI proposals.
//
// IMPORTANT PROVENANCE NOTE: this is the Judges Edition application source
// scaffold. Per project boundary rules, it must be integrated into the
// authorized BOTB application project by whoever holds the source rights;
// it is NOT a stand-in claiming to be the original app. See BUILD_REPORT.md.

import SwiftUI

@main
struct BOTBJudgesApp: App {
    var body: some Scene {
        WindowGroup {
            AuthGate {
                MainTabView()
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack { JudgeSubmissionView() }
                .tabItem { Label("Judge", systemImage: "target") }
            NavigationStack { MultiJudgeCompareView() }
                .tabItem { Label("Compare", systemImage: "square.3.layers.3d.down.left") }
            NavigationStack { AIProposalView() }
                .tabItem { Label("AI", systemImage: "sparkles") }
        }
    }
}
