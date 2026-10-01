import ActivityKit
import Foundation

/// Describes the Live Activity that shows your image in the Dynamic Island.
/// This file is compiled into both the app and the widget extension.
struct IslandAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var startedAt: Date
    }
}

/// Name of the image in Shared/Assets.xcassets.
/// To use your own picture, replace the PNG inside IslandImage.imageset.
let islandImageName = "IslandImage"
