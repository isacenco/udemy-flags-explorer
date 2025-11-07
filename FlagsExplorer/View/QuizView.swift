//
//  QuizView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 7/11/25.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var viewModel: FlagsQuizViewModel
    
    var question: QuizQuestion
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ProgressView(value: Double(viewModel.currentQuestionIndex + 1), total: 10)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(.white)
                .padding(.horizontal)
            
            Spacer()
            
            AsyncImage(url: question.flagUrl) { phase in
                switch phase {
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                case .failure:
                    Image(systemName: "flag.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .padding()

            Spacer()
            
            ForEach(0..<4, id: \.self) { index in
                Button {
                    viewModel.checkAnswer(index: index)
                } label: {
                    Text(question.options[index])
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.buttonColor(for: index))
                        .foregroundColor(.black)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                }
                .disabled(viewModel.isAnswered)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            Spacer()
        }
        .background(.ultraThinMaterial.opacity(0.7))
        .cornerRadius(20)
        .padding(30)
    }
}

#Preview {
    @Previewable @State var viewModel = FlagsQuizViewModel()
    let quizQuestion = QuizQuestion(
        flagUrl: URL(string: "https://raw.githubusercontent.com/vkhmelev/FlagsData/master/flags/1.png")!,
        options: ["Option 1", "Option 2", "Option 3", "Option 4"],
        correctAnswer: "Option 1"
    )

    ZStack {
        
        VStack {
            QuizView(viewModel: $viewModel, question: quizQuestion)
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(.worldMap)
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea()
    
}
