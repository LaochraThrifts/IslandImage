import SwiftUI
import WidgetKit

@main
struct IslandWidgetBundle: WidgetBundle {
    var body: some Widget {
        IslandLiveActivity()
        IslandTestWidget()
    }
}

// MARK: - Test home-screen widget
// A plain home-screen widget that shows the same image. If you can add this
// to your home screen, the widget part of the app is working.

struct TestEntry: TimelineEntry {
    let date: Date
}

struct TestProvider: TimelineProvider {
    func placeholder(in context: Context) -> TestEntry { TestEntry(date: .now) }
    func getSnapshot(in context: Context, completion: @escaping (TestEntry) -> Void) {
        completion(TestEntry(date: .now))
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<TestEntry>) -> Void) {
        completion(Timeline(entries: [TestEntry(date: .now)], policy: .never))
    }
}

struct IslandTestWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "IslandTestWidget", provider: TestProvider()) { _ in
            Image(islandImageName)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .padding(8)
                .containerBackground(.black, for: .widget)
        }
        .configurationDisplayName("Island Image Test")
        .description("Shows your island image.")
        .supportedFamilies([.systemSmall])
    }
}
