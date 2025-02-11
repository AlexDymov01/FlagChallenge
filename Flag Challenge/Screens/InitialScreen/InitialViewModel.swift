import Foundation

final class InitialScreenViewModel: ObservableObject {
    
    // MARK: - Enumerations
    
    enum DisplayText {
        static let titleText: String = "Welcome to the Flag Challenge!"
        static let subtitleText: String = "Test your flag knowledge and become a champion!"
        static let startButtonText: String = "Start"
    }
    
    // MARK: - UI Properties
    
    var titleText: String {
        DisplayText.titleText
    }
    
    var subtitleText: String {
        DisplayText.subtitleText
    }
    
    var startButtonText: String {
        DisplayText.startButtonText
    }
}
