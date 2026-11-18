import SwiftUI

@main
struct BOTBJudgesApp: App {
    var body: some Scene {
        WindowGroup {
            AuthGate {
                NavigationStack { SevenJudgePanelView() }
            }
        }
    }
}
