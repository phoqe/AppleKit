import SwiftUI

@available(iOS 16.0, *)
struct PresentationOverlay: View {
    
    let disclaimer: String?
    
    let primaryButton: PresentationButton?
    let secondaryButton: PresentationButton?

    init(
        disclaimer: String? = nil,
        primaryButton: PresentationButton? = nil,
        secondaryButton: PresentationButton? = nil
    ) {
        self.disclaimer = disclaimer
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            if let disclaimer {
                Text(disclaimer)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            if let primaryButton {
                SwiftUI.Button(action: primaryButton.action) {
                    Text(primaryButton.title)
                        .fontWeight(.semibold)
                        .padding(.vertical, 7.5)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(15)
                .frame(minWidth: UIScreen.main.bounds.width - 100, maxWidth: .infinity) // fixes weird padding issue where button would get small if no text, `100` is the padding on both sides
                
                if secondaryButton == nil {
                    SwiftUI.Button("Set Up Later in Settings") {
                        
                    }
                    .fontWeight(.semibold)
                    .hidden()
                }
            }
            
            if let secondaryButton {
                SwiftUI.Button(secondaryButton.title, action: secondaryButton.action)
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal, 50)
        .multilineTextAlignment(.center)
    }
}

@available(iOS 16.0, *)
struct PresentationOverlay_Previews: PreviewProvider {
    static var previews: some View {
        PresentationOverlay()
    }
}
