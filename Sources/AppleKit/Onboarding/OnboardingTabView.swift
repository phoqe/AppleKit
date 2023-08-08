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
                PresentationMask()
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
                    OnboardingTabView(systemImage: "person.and.background.dotted", title: "Data & Privacy", subtitle: "This icon appears when an Apple feature asks to use vour personal information.", primaryButton: .init(title: "Continue", action: {})) {
                        GroupBox {
                            TextField("Annual Income", text: .constant(""))
                        }
                    }
                ])
            }
    }
}
