import SwiftUI

final class GameViewModel: ObservableObject {
    
    // MARK: - Game Logic Properties
    
    @Published var countries: [CountryModel] = []
    @Published var currentIndex = 0
    @Published var score = 0

    // MARK: - UI Properties
    
    @Published var showOverlay: Bool = false
    @Published var overlayMessage: String = ""
    @Published var answerOptions: [(title: String, isCorrect: Bool)] = []
    @Published var isAnswering: Bool = false
    @Published var showResults: Bool = false

    // MARK: - Computed Properties
    
    var currentCountry: CountryModel? {
        guard countries.indices.contains(currentIndex) else { return nil }
        return countries[currentIndex]
    }
    
    var isGameOver: Bool {
        currentIndex >= 5
    }
    
    // MARK: - Initializer
    
    init() {
        loadCountries()
        updateAnswerOptions()
    }
    
    // MARK: - Data Loading
    
    func loadCountries() {
        countries = CountryService.shared.createCountryModels()
    }
    
    // MARK: - Game Logic
    
    func checkAnswer(selected: CountryModel) {
        if selected.name == countries[currentIndex].name {
            score += 1
        }
        currentIndex += 1
    }
    
    func updateAnswerOptions() {
        guard let current = currentCountry else { return }
        let correctAnswer = current.name
        let wrongAnswer = getWrongAnswer()
        if Bool.random() {
            answerOptions = [(title: correctAnswer, isCorrect: true),
                             (title: wrongAnswer, isCorrect: false)]
        } else {
            answerOptions = [(title: wrongAnswer, isCorrect: false),
                             (title: correctAnswer, isCorrect: true)]
        }
    }
    
    func getWrongAnswer() -> String {
        guard let current = currentCountry else { return "Unknown" }
        let correctName = current.name
        let wrongOptions = countries.filter { $0.name != correctName }
        return wrongOptions.randomElement()?.name ?? "Unknown"
    }
    
    // MARK: - User Interaction
    
    func answerTapped(isCorrect: Bool) {
        guard !isAnswering else { return }
        isAnswering = true
        overlayMessage = isCorrect ? "Success! Well Done! 👍" : "Wrong :( You can do better 😢"
        
        withAnimation {
            showOverlay = true
        }
        
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            await MainActor.run {
                self.submitAnswer(isCorrect: isCorrect)
            }
        }
    }
    
    private func getSelectedAnswer(isCorrect: Bool) -> CountryModel? {
        if isCorrect, let current = currentCountry {
            return current
        } else if let wrongOption = answerOptions.first(where: { !$0.isCorrect }) {
            return CountryModel(name: wrongOption.title, countryImage: nil)
        }
        return nil
    }

    private func submitAnswer(isCorrect: Bool) {
        let selectedAnswer = getSelectedAnswer(isCorrect: isCorrect)
        
        if let answer = selectedAnswer {
            checkAnswer(selected: answer)
        }
        
        withAnimation(.easeOut(duration: 1)) {
            showOverlay = false
        }
        
        isAnswering = false
        
        if isGameOver {
            showResults = true
        } else {
            updateAnswerOptions()
        }
    }
    
    // MARK: - Reset Game
    
    func resetGame() {
        currentIndex = 0
        score = 0
        loadCountries()
        updateAnswerOptions()
    }
}
