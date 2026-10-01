import ActivityKit
import SwiftUI

struct ContentView: View {
    @State private var isRunning = false
    @State private var message = ""

    var body: some View {
        VStack(spacing: 24) {
            Image(islandImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 24))

            Text("Island Image")
                .font(.largeTitle.bold())

            Text(isRunning
                 ? "Your image is on the Dynamic Island.\niOS ends it after about 8 hours — just tap Start again."
                 : "Tap Start to put your image on the Dynamic Island.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            Button(isRunning ? "Restart" : "Start") { start() }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

            if isRunning {
                Button("Stop", role: .destructive) { stop() }
                    .buttonStyle(.bordered)
            }

            if !message.isEmpty {
                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .onAppear { refresh() }
    }

    private func refresh() {
        isRunning = !Activity<IslandAttributes>.activities.isEmpty
    }

    private func start() {
        message = ""
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            message = "Live Activities are turned off. Turn them on in Settings > Island Image."
            return
        }
        Task {
            // End any old one first so only one image shows at a time.
            for activity in Activity<IslandAttributes>.activities {
                await activity.end(nil, dismissalPolicy: .immediate)
            }
            do {
                let state = IslandAttributes.ContentState(startedAt: .now)
                _ = try Activity.request(
                    attributes: IslandAttributes(),
                    content: .init(state: state, staleDate: nil),
                    pushType: nil
                )
                await MainActor.run { refresh() }
            } catch {
                await MainActor.run { message = "Couldn't start: \(error.localizedDescription)" }
            }
        }
    }

    private func stop() {
        Task {
            for activity in Activity<IslandAttributes>.activities {
                await activity.end(nil, dismissalPolicy: .immediate)
            }
            await MainActor.run { refresh() }
        }
    }
}
