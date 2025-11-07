//
//  FlagsQuizViewModel.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 7/11/25.
//

import SwiftUI

@Observable
class FlagsQuizViewModel {
    var questions: [QuizQuestion] = []
    var currentQuestionIndex = 0
    var score = 0
    var isAnswered = false
    var quizCompleted = false
    var selectedAnswerIndex: Int? = nil
    
    var currentQuestion: QuizQuestion? {
        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
    }
    
    
    
    func prepareQuestions(from countries: [CountryElement]) {
        questions = Array(countries.shuffled().prefix(10)).compactMap({ country in
            guard let url = URL(string: country.flags.png) else { return nil }
            
            let otherCountries = countries.filter { $0.name.common != country.name.common }.shuffled()
            let randomOptions = otherCountries.prefix(3).map { $0.name.common }
            
            let options = ([country.name.common] + randomOptions).shuffled()
            
            return QuizQuestion(flagUrl: url, options: options, correctAnswer: country.name.common)
        })
    }
    
    func checkAnswer(index: Int) {
        guard let question = currentQuestion else { return }
        isAnswered = true
        selectedAnswerIndex = index
        if question.options[index] == question.correctAnswer {
            score += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.moveToNextQuestion()
        }
    }
    
    func moveToNextQuestion() {
        isAnswered = false
        selectedAnswerIndex = nil
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
        } else {
            quizCompleted = true
        }
    }
    
    func buttonColor(for index: Int) -> Color {
        guard isAnswered, let question = currentQuestion else { return .white }
        
        if index == selectedAnswerIndex {
            return question.correctAnswer == question.options[index] ? .green : .red
        }
        
        return .white
    }
}
