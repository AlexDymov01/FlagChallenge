import SwiftUI

struct GameView: View {
    @StateObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            backgroundGradient()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                headerView
                flagImageView
                answerButtonsView
                Spacer()
            }
            .padding()
            
            if viewModel.showOverlay {
                overlayView
                    .transition(.opacity)
            }
        }
        .hideNavigationBar()
        .fullScreenCover(isPresented: $viewModel.showResults, onDismiss: viewModel.resetGame) {
            ResultsAssembly().build(with: viewModel.score)
        }
        .onReceive(viewModel.$currentIndex) { _ in
            viewModel.updateAnswerOptions()
        }
    }
}

extension GameView {
    private var headerView: some View {
        Text("Choose the flag for this country")
            .font(.gameHeader)
            .padding()
    }
    
    private var flagImageView: some View {
        Group {
            if let flagImage = viewModel.currentCountry?.countryImage {
                Image(uiImage: flagImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .padding()
            } else {
                Text("❓")
                    .font(.largeTitle)
            }
        }
    }
    
    private var answerButtonsView: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.answerOptions, id: \.title) { option in
                Button(action: {
                    viewModel.answerTapped(isCorrect: option.isCorrect)
                }) {
                    Text(option.title)
                        .font(.gameButton)
                }
                .buttonStyle(AnswerButtonStyle())
            }
        }
        .padding()
    }
    
    private var overlayView: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .blur(radius: 10)
            VStack {
                Spacer()
                Text(viewModel.overlayMessage)
                    .font(.gameOverlay)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .shadow(radius: 8)
                            .foregroundStyle(.white)
                            .frame(height: 100)
                    )
            }
            .padding(.bottom, 70)
        }
    }
}

#Preview {
    GameView(viewModel: GameViewModel())
}
