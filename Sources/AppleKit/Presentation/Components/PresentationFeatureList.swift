import SwiftUI

struct PresentationFeatureList: View {
    let features: [PresentationFeature]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(features) { feature in
                PresentationFeatureListItem(feature: feature)
            }
        }
    }
}

struct PresentationFeatureList_Previews: PreviewProvider {
    static var previews: some View {
        PresentationFeatureList(features: [])
    }
}
