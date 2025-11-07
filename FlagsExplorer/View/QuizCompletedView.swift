//
//  QuizCompletedView.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 7/11/25.
//

import SwiftUI

struct QuizCompletedView: View {
    @Binding var viewModel: FlagsQuizViewModel
    var countries: [CountryElement]
    var body: some View {
        VStack {
            Text("Congratulations!! \n Quiz Completed")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding()
            
            Text("Your Score \(viewModel.score) / 10")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding()
            
            Button {
                viewModel.resetQuiz(countries: countries)
            } label: {
                HStack {
                    Text("Play Again")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        
                    Image(systemName: "gamecontroller.fill")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .symbolEffect(.breathe)
                }
                .padding()
                .foregroundStyle(.white)
                .background(
                    LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(10)
                .shadow(radius: 20)
            }
        }
        .padding(EdgeInsets(top: 50, leading: 20, bottom: 50, trailing: 20))
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

#Preview {
    @Previewable @State var viewModel: FlagsQuizViewModel = .init()
    let countries = [
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
    ]
    ZStack {
        QuizCompletedView(viewModel: $viewModel, countries: countries)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
        Image(.worldMap)
            .resizable()
            .scaledToFill()
    )
    .ignoresSafeArea()

}
