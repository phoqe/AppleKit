import SwiftUI

@available(iOS 16.0, *)
public struct OnboardingTabView<Content: View>: View {
    let systemImage: String
    
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey
    
    let primaryButton: PresentationButton
    let secondaryButton: PresentationButton?
    
    @ViewBuilder
    let content: Content
    
    public init(
        systemImage: String,
        
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey,

        primaryButton: PresentationButton,
        secondaryButton: PresentationButton? = nil,
        
        @ViewBuilder
        content: () -> Content
    ) {
        self.systemImage = systemImage

        self.title = title
        self.subtitle = subtitle

        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
        
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 25) {
                    Group {
                        Image(systemName: systemImage)
                            .font(.system(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize * 2))
                            .foregroundColor(.accentColor)
                        
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(subtitle)
                            .font(.body)
                    }
                    .multilineTextAlignment(.center)
                    
                    content
                }
                .padding(.top, 50)
                .padding(.horizontal, 50)
                .padding(.bottom, 125)
            }
            .mask {
                LinearGradient(gradient: Gradient(colors: [.primary, .primary.opacity(0)]), startPoint: UnitPoint(x: 0.5, y: 0.85), endPoint: .bottom)
            }
        }
        .overlay(alignment: .bottom) {
            PresentationOverlay(
                primaryButton: primaryButton,
                secondaryButton: secondaryButton
            )
        }
    }
}

@available(iOS 16.0, *)
struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Onboarding")
            .sheet(isPresented: .constant(true)) {
                OnboardingView(selection: .constant(0), tabs: [
                    OnboardingTabView(systemImage: "person.and.background.dotted", title: "Data & Privacy", subtitle: "This icon appears when an Apple feature asks to use vour personal information.\n\nYou won't see this with every feature since Apple collects this information only when needed to enable features, secure our services or personalise your experience.\n\nApple believes privacy is a fundamental human right, so every Apple product is designed to minimise the collection and use of your data, use on-device processing whenever possible, and provide transparency and control over your information.", primaryButton: .init(title: "Continue", action: {
                        
                    })) {
                        
                    }
                ])
            }
    }
}
