import SwiftUI

struct PresentationFeatureListItem: View {
    
    let feature: PresentationFeature
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            if let systemImage = feature.systemImage {
                Image(systemName: systemImage)
                    .font(.title)
                .foregroundColor(.accentColor)
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

struct PresentationFeatureListItem_Previews: PreviewProvider {
    static var previews: some View {
        PresentationFeatureListItem(feature: PresentationFeature(subheadline: ""))
    }
}
