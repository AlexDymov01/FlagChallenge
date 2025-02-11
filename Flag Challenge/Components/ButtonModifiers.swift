import SwiftUI

struct AnswerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width * 0.75)
            .padding(.vertical, 12)
            .background(Color.white)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct RestartButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 100)
            .padding(.vertical, 12)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.greyStroke.opacity(0.4), lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 50)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(LinearGradient.selectionButton)
            )
            .foregroundColor(.black)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}


