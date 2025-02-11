import SwiftUI

final class ResultsViewModel: ObservableObject {
    // MARK: - Properties
    
    let score: Int
    
    // MARK: - Initializer
    
    init(score: Int) {
        self.score = score
    }
    
    // MARK: - UI Properties Calculation
    
    func performanceText() -> String {
        switch score {
        case 5:
            return "Excellent! 🎉"
        case 4:
            return "Great Job! 👍"
        case 3:
            return "Good Effort! 🙂"
        default:
            return "Keep Practicing! 💪"
        }
    }
    
    func scorePercentage() -> Double {
        Double(score) / 5.0
    }
}
