//
//  FlagsQuizView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 7/11/25.
//

import SwiftUI

struct FlagsQuizView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: FlagsQuizViewModel = FlagsQuizViewModel()
    
    var name: String = "Europe"
    var countries: [CountryElement] = []
    
    
    fileprivate func BackButton() -> ToolbarItem<(), Button<some View>> {
        return ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                }
                .foregroundStyle(.white)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Image(.worldMap)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            
            VStack {
                if let question = viewModel.currentQuestion {
                    QuizView(viewModel: $viewModel, question: question)
                }
            }.task {
                viewModel.prepareQuestions(from: countries)
            }
        }
        .toolbar {
            if #available(iOS 26, *) {
                BackButton()
                .sharedBackgroundVisibility(.hidden)
            } else {
                BackButton()
            }
            
            ToolbarItem(placement: .principal) {
                Text(name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
        }
    }
}

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
    NavigationView {
        FlagsQuizView(name: "Europe", countries: [
            CountryElement(name: Name(common: "Norway"), flags: Flags(png: "https://flagcdn.com/w320/no.png")),
            CountryElement(name: Name(common: "Greece"), flags: Flags(png: "https://flagcdn.com/w320/gr.png")),
            CountryElement(name: Name(common: "Åland Islands"), flags: Flags(png: "https://flagcdn.com/w320/ax.png")),
            CountryElement(name: Name(common: "Switzerland"), flags: Flags(png: "https://flagcdn.com/w320/ch.png")),
            CountryElement(name: Name(common: "Croatia"), flags: Flags(png: "https://flagcdn.com/w320/hr.png")),
            CountryElement(name: Name(common: "Iceland"), flags: Flags(png: "https://flagcdn.com/w320/is.png")),
            CountryElement(name: Name(common: "Luxembourg"), flags: Flags(png: "https://flagcdn.com/w320/lu.png")),
            CountryElement(name: Name(common: "Hungary"), flags: Flags(png: "https://flagcdn.com/w320/hu.png")),
            CountryElement(name: Name(common: "Netherlands"), flags: Flags(png: "https://flagcdn.com/w320/nl.png")),
            CountryElement(name: Name(common: "Lithuania"), flags: Flags(png: "https://flagcdn.com/w320/lt.png")),
            CountryElement(name: Name(common: "Liechtenstein"), flags: Flags(png: "https://flagcdn.com/w320/li.png")),
        ])
    }
}
