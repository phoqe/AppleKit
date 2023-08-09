import Foundation

public struct PresentationFeature: Identifiable {
    public let id = UUID()
    
    let emoji: String?
    let systemImage: String?
    
    let headline: String?
    let subheadline: String
    
    public init(emoji: String? = nil, systemImage: String? = nil, headline: String? = nil, subheadline: String) {
        self.emoji = emoji
        self.systemImage = systemImage
        self.headline = headline
        self.subheadline = subheadline
    }
}
