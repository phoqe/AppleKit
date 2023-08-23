#if os(iOS)
import SwiftUI

@available(iOS 16.0, *)
public struct PresentationView<Content: View>: View {
    let systemImage: String?
    let emoji: String?
    let image: Image?
    
    let title: String
    let subtitle: String?
    let text: String?
    let features: [PresentationFeature]?
    
    let disclaimer: String?
    let primaryButton: PresentationButton?
    let secondaryButton: PresentationButton?
    
    let sheet: Bool
    
    @ViewBuilder
    let content: Content
    
    public init(
        systemImage: String? = nil,
        emoji: String? = nil,
        image: Image? = nil,
        
        title: String,
        subtitle: String? = nil,
        text: String? = nil,
        features: [PresentationFeature]? = nil,
        
        disclaimer: String? = nil,
        primaryButton: PresentationButton? = nil,
        secondaryButton: PresentationButton? = nil,
        
        sheet: Bool = true,
        
        @ViewBuilder
        content: () -> Content
    ) {
        self.systemImage = systemImage
        self.emoji = emoji
        self.image = image
        
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.features = features
        
        self.disclaimer = disclaimer
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
        
        self.sheet = sheet
        
        self.content = content()
    }
    
    var showOverlay: Bool {
        disclaimer != nil || primaryButton != nil || secondaryButton != nil
    }
    
    public var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 25) {
                    Group {
                        if let systemImage {
                            Image(systemName: systemImage)
                                .font(.system(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize * 2))
                                .foregroundColor(.accentColor)
                        } else if let emoji {
                            Text(emoji)
                                .font(.system(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize * 2.75))
                                .padding(.bottom, -10)
                        } else if let image {
                            image
                        }
                        
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.95)
                        
                        if let subtitle {
                            Text(subtitle)
                                .font(.body)
                                .allowsTightening(true)
                        }
                    }
                    .multilineTextAlignment(.center)
                    
                    if let text {
                        Text(text)
                            .font(.callout)
                    } else if let features {
                        PresentationFeatureList(features: features)
                            .padding(.top, 25)
                    } else {
                        content
                    }
                }
                .if(sheet) { view in
                    view.padding(.top, 50)
                }
                .padding(.horizontal, 50)
                .if(showOverlay) { view in
                    view.padding(.bottom, 125)
                }
                .if(!showOverlay) { view in
                    view.padding(.bottom, 50)
                }
            }
            .if(showOverlay) { view in
                view.mask {
                    PresentationMask()
                }
            }
        }
        .if(showOverlay) { view in
            view.overlay(alignment: .bottom) {
                PresentationOverlay(
                    disclaimer: disclaimer,
                    primaryButton: primaryButton,
                    secondaryButton: secondaryButton
                )
            }
        }
    }
}

@available(iOS 16.0, *)
struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PresentationView(
                image: Image(systemName: "bell"),
                title: "Fastighetsdeklaration",
                subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                disclaimer: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                primaryButton: .init(title: "Continue", action: {
                    
                }),
                secondaryButton: .init(title: "Set Up Later in Settings", action: {
                    
                }),
                sheet: false
            ) {
                
            }
        }
        
        NavigationStack {
            PresentationView(
                emoji: "⚖️",
                title: "Fastighetsdeklaration",
                subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                disclaimer: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                primaryButton: .init(title: "Continue", action: {
                    
                }),
                secondaryButton: .init(title: "Set Up Later in Settings", action: {
                    
                }),
                sheet: false
            ) {
                
            }
        }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    emoji: "🤖",
                    title: "What’s New",
                    subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    disclaimer: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    primaryButton: .init(title: "Continue", action: {
                        
                    })
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    systemImage: "minus.plus.batteryblock.fill",
                    title: "What’s New",
                    subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    disclaimer: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    primaryButton: .init(title: "Continue", action: {
                        
                    })
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    systemImage: "minus.plus.batteryblock.fill",
                    title: "What’s New",
                    subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    text: "To enable users to participate in actions that require a Hacker News account, such as upvoting a story or submitting a comment, the app automatically persists the user’s login to the official site in the background.\n\nThis is achieved through the use of HTTPS, which is a secure communication protocol that encrypts the data transmitted between the app and the official site. The encrypted data includes the user’s login information, ensuring that it remains confidential and protected against unauthorized access.\n\nBy using HTTPS, the app provides an additional layer of security compared to a standard connection, as it protects the user’s login information from being intercepted and viewed by third parties. The app’s implementation of HTTPS also meets industry standards for secure communication and is widely used by organizations and websites to protect sensitive information.\n\nMoreover, the app eliminates the need for the user to enter their login information repeatedly, making the app more convenient and efficient. The app’s persistent login feature ensures that users can participate in actions on Hacker News with ease and peace of mind, knowing that their login information is secure."
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    systemImage: "minus.plus.batteryblock.fill",
                    title: "What’s New",
                    subtitle: "Circular imports occur in Python when two or more modules depend on each other. This can create a problem because the modules cannot be loaded properly, and Python will raise an error.",
                    text: "To enable users to participate in actions that require a Hacker News account, such as upvoting a story or submitting a comment, the app automatically persists the user’s login to the official site in the background.\n\nThis is achieved through the use of HTTPS, which is a secure communication protocol that encrypts the data transmitted between the app and the official site. The encrypted data includes the user’s login information, ensuring that it remains confidential and protected against unauthorized access.\n\nBy using HTTPS, the app provides an additional layer of security compared to a standard connection, as it protects the user’s login information from being intercepted and viewed by third parties. The app’s implementation of HTTPS also meets industry standards for secure communication and is widely used by organizations and websites to protect sensitive information.\n\nMoreover, the app eliminates the need for the user to enter their login information repeatedly, making the app more convenient and efficient. The app’s persistent login feature ensures that users can participate in actions on Hacker News with ease and peace of mind, knowing that their login information is secure.",
                    primaryButton: .init(title: "Continue", action: {
                        
                    }),
                    secondaryButton: .init(title: "Set Up Later in Settings", action: {
                        
                    })
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    title: "What’s New"
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    title: "What’s New",
                    features: [
                        PresentationFeature(
                            systemImage: "person.2",
                            headline: "Shared Library",
                            subheadline: "Combine photos and videos with the people closest to you and automatically share new photos from Camera."
                        ),
                        PresentationFeature(
                            systemImage: "slider.horizontal.2.square.on.square",
                            headline: "Copy & Paste Edits",
                            subheadline: "Save time by making edits to one photo, then applying the changes to other photos with a tap."
                        ),
                        PresentationFeature(
                            systemImage: "square.on.square",
                            headline: "Shared Library",
                            subheadline: "Quickly find and merge all your duplicate photos and videos from one central place in the Albums tab."
                        )
                    ]
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    title: "What’s New",
                    features: [
                        PresentationFeature(
                            emoji: "👩‍⚖️",
                            subheadline: "Combine photos and videos with the people closest to you and automatically share new photos from Camera."
                        ),
                        PresentationFeature(
                            emoji: "🦺",
                            subheadline: "Save time by making edits to one photo, then applying the changes to other photos with a tap."
                        ),
                        PresentationFeature(
                            emoji: "💵",
                            subheadline: "Quickly find and merge all your duplicate photos and videos from one central place in the Albums tab."
                        )
                    ]
                ) {
                    
                }
            }
        
        Text("Presentation")
            .sheet(isPresented: .constant(true)) {
                PresentationView(
                    title: "What’s New",
                    primaryButton: .init(title: "Continue", action: {
                        
                    })
                ) {
                    
                }
            }
        
//        Text("Presentation")
//            .sheet(isPresented: .constant(true)) {
//                PresentationView(
//                    systemImage: "person.and.background.dotted",
//                    title: "Data & Privacy",
//                    subtitle: "This icon appears when an Apple feature asks to use vour personal information.\n\nYou won't see this with every feature since Apple collects this information only when needed to enable features, secure our services or personalise your experience.\n\nApple believes privacy is a fundamental human right, so every Apple product is designed to minimise the collection and use of your data, use on-device processing whenever possible, and provide transparency and control over your information."
//                ) {
//
//                }
//            }
    }
}
#endif
