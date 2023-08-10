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
        VStack(spacing: 25) {
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
        .padding(.horizontal, 50) // TODO: when only button is shown and no text this shrinks button
        .multilineTextAlignment(.center)
    }
}

@available(iOS 16.0, *)
struct PresentationOverlay_Previews: PreviewProvider {
    static var previews: some View {
        PresentationOverlay()
    }
}
