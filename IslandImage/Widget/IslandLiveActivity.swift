import ActivityKit
import SwiftUI
import WidgetKit

struct IslandLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: IslandAttributes.self) { _ in
            // Lock Screen / notification banner view
            HStack(spacing: 12) {
                islandImage.frame(width: 44, height: 44)
                Text("Island Image")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .activityBackgroundTint(.black)
            .activitySystemActionForegroundColor(.white)

        } dynamicIsland: { _ in
            DynamicIsland {
                // Expanded view (long-press the island)
                DynamicIslandExpandedRegion(.center) {
                    islandImage.frame(width: 80, height: 80)
                }
            } compactLeading: {
                // Left of the camera
                islandImage.frame(width: 24, height: 24)
            } compactTrailing: {
                // Right of the camera (left empty on purpose)
                EmptyView()
            } minimal: {
                // Tiny dot when another app shares the island
                islandImage.frame(width: 22, height: 22)
            }
        }
    }

    private var islandImage: some View {
        Image(islandImageName)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}
