#if os(iOS)
import SwiftUI

@available(iOS 16.0, *)
struct PresentationView: View {
    struct Button {
        let title: LocalizedStringKey
        let action: () -> Void
    }
    
    let systemIcon: String?
    
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey?
    let text: LocalizedStringKey?
    
    let disclaimer: LocalizedStringKey?
    let primaryButton: PresentationView.Button?
    let secondaryButton: PresentationView.Button?
    
    init(
        systemIcon: String? = nil,
        
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey? = nil,
        text: LocalizedStringKey? = nil,
        
        disclaimer: LocalizedStringKey? = nil,
        primaryButton: PresentationView.Button? = nil,
        secondaryButton: PresentationView.Button? = nil
    ) {
        self.systemIcon = systemIcon
        
        self.title = title
        self.subtitle = subtitle
        self.text = text
        
        self.disclaimer = disclaimer
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }
    
    var doubleLargeTitle: Font {
        Font.system(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize * 2)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView {
                Group {
                    VStack(alignment: .center, spacing: 25) {
                        VStack(alignment: .center, spacing: 25) {
                            if let systemIcon {
                                Image(systemName: systemIcon)
                                    .font(doubleLargeTitle)
                                    .foregroundColor(.accentColor)
                            }
                            
                            Text(title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            if let subtitle {
                                Text(subtitle)
                                    .font(.body)
                            }
                        }
                        .multilineTextAlignment(.center)
                        
                        if let text {
                            Text(text)
                                .font(.callout)
                        }
                    }
                    .padding(.vertical, 50)
                }
                .padding(.horizontal, 50)
            }
                    
            if disclaimer != nil || primaryButton != nil || secondaryButton != nil {
                Spacer()
                
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
                    }
                    
                    if let secondaryButton {
                        SwiftUI.Button(secondaryButton.title, action: secondaryButton.action)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 50)
                .multilineTextAlignment(.center)
            }
        }
    }
}

@available(iOS 16.0, *)
struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        // Full
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    systemIcon: "minus.plus.batteryblock.fill",
                    title: "What’s New",
                    subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    disclaimer: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    primaryButton: .init(title: "Continue", action: {
                        
                    }),
                    secondaryButton: .init(title: "Set Up Later in Settings", action: {
                        
                    })
                )
            }
        
        // Text
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    systemIcon: "minus.plus.batteryblock.fill",
                    title: "What’s New",
                    subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    text: "To enable users to participate in actions that require a Hacker News account, such as upvoting a story or submitting a comment, the app automatically persists the user’s login to the official site in the background.\n\nThis is achieved through the use of HTTPS, which is a secure communication protocol that encrypts the data transmitted between the app and the official site. The encrypted data includes the user’s login information, ensuring that it remains confidential and protected against unauthorized access.\n\nBy using HTTPS, the app provides an additional layer of security compared to a standard connection, as it protects the user’s login information from being intercepted and viewed by third parties. The app’s implementation of HTTPS also meets industry standards for secure communication and is widely used by organizations and websites to protect sensitive information.\n\nMoreover, the app eliminates the need for the user to enter their login information repeatedly, making the app more convenient and efficient. The app’s persistent login feature ensures that users can participate in actions on Hacker News with ease and peace of mind, knowing that their login information is secure."
                )
            }
        
        // Required
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    title: "What’s New"
                )
            }
        
        // Info
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    systemIcon: "person.and.background.dotted",
                    title: "Data & Privacy",
                    subtitle: "This icon appears when an Apple feature asks to use vour personal information.\n\nYou won't see this with every feature since Apple collects this information only when needed to enable features, secure our services or personalise your experience.\n\nApple believes privacy is a fundamental human right, so every Apple product is designed to minimise the collection and use of your data, use on-device processing whenever possible, and provide transparency and control over your information."
                )
            }
    }
}
#endif
