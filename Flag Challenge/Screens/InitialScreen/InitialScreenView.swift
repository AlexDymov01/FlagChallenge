import SwiftUI

struct InitialScreenView: View {
    @StateObject var viewModel: InitialScreenViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient()
                    .ignoresSafeArea()
                content
            }
            .hideNavigationBar()
        }
    }
}

extension InitialScreenView {
    private var content: some View {
        VStack {
            Spacer()
            headerView
            Spacer()
            startButtonView
            Spacer()
        }
        .padding()
    }
    
    private var headerView: some View {
        VStack(spacing: 24) {
            Text(viewModel.titleText)
                .font(.initialTitle)
            Text(viewModel.subtitleText)
                .font(.initialSubtitle)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
        .padding(.bottom, 40)
    }
    
    private var startButtonView: some View {
        NavigationLink(destination: GameAssembly().build()) {
            Text(viewModel.startButtonText)
                .font(.initialSubtitle)
        }
        .buttonStyle(StartButtonStyle())
    }
}

#Preview {
    InitialScreenView(viewModel: InitialScreenViewModel())
}
