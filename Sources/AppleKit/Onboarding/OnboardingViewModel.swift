import Foundation
import SwiftUI

@available(iOS 15.0, *)
class OnboardingViewModel: ObservableObject {
    
    let dismiss: DismissAction
    
    init(dismiss: DismissAction) {
        self.dismiss = dismiss
    }
    
    @Published
    var currentTab: Int = 0
    
    func nextTab() {
        if currentTab < numberOfTabs - 1 {
            currentTab = currentTab + 1
        } else {
            finish()
        }
    }
    
    func previousTab() {
        if currentTab > 0 {
            currentTab = currentTab - 1
        }
    }
    
    var numberOfTabs: Int {
        return 2
    }
    
    func finish() {
        dismiss()
    }
}
