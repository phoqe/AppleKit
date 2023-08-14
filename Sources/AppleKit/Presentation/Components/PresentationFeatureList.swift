import SwiftUI

@available(iOS 14.0, *)
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

@available(iOS 14.0, *)
struct PresentationFeatureList_Previews: PreviewProvider {
    static var previews: some View {
        PresentationFeatureList(features: [
            PresentationFeature(
                systemImage: "person.crop.circle",
                headline: "Profiler",
                subheadline: "Skapa en profil med uppgifter som födelsedatum och årsinkomst för att beräkna dina avdrag. Dina uppgifter stannar på din enhet och alla beräkningar sker lokalt."
            ),
            PresentationFeature(
                systemImage: "car",
                headline: "Fordon",
                subheadline: "Lägg till dina fordon i Inställningar."
            ),
        ])
    }
}
