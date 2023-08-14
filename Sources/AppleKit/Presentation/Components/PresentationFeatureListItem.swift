import SwiftUI

@available(iOS 14.0, *)
struct PresentationFeatureListItem: View {
    
    let feature: PresentationFeature
    
    @ScaledMetric
    var width = 50
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            if let systemImage = feature.systemImage {
                Image(systemName: systemImage)
                    .font(.title)
                    .foregroundColor(.accentColor)
                    .frame(width: width)
            }
            
            if let emoji = feature.emoji {
                Text(emoji)
                    .font(.title)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                if let headline = feature.headline {
                    Text(headline)
                        .font(.headline)
                }
                
                Text(feature.subheadline)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

@available(iOS 14.0, *)
struct PresentationFeatureListItem_Previews: PreviewProvider {
    static var previews: some View {
        PresentationFeatureListItem(feature: PresentationFeature(subheadline: ""))
    }
}
