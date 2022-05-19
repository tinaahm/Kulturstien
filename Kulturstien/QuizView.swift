//
//  QuizView.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

import SwiftUI

var shuffled: Bool = false

struct QuizView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var quizType: QuizType
	@State var questionIndex = 0
	@State var answered : Bool = false
	
	//@State var answers: [String] = [String]()
	@State var quiz: Quiz
	
	init(quizType: QuizType) {
		self.quizType = quizType
		self.quiz = getQuizByType(quizType: quizType)
		//self.answers = quiz.shuffledAnswers[questionIndex]
	}
	
	
    var body: some View {
		
		var numberOfQuestions = quiz.questions.count
		var correctAnswer: String = quiz.questions[questionIndex].correctOption
		var answers: [String] = quiz.shuffledAnswers[questionIndex]
		
		VStack {
			HStack {
				Text(quiz.name)
					.font(.title)
			}
			.padding()
			Text(String(questionIndex + 1) + "/" + String(numberOfQuestions))
				.font(.title3)
				.padding(.bottom)
			Text(quiz.questions[questionIndex].question)
				.font(.title2)
				.padding(.bottom)
			
			Group {
				ForEach(0 ..< numberOfQuestions) {
					value in
					Button (action: {
						self.answered = true
					}) {
						Text(answers[value])
							.foregroundColor(.black)
							.padding()
							.overlay(
								RoundedRectangle(cornerRadius: 20)
									.stroke(showAnswer(answered: answered, guessedAnswer: answers[value], correctAnswer: correctAnswer), lineWidth: 3)
							)
					}
					//.padding(.vertical, 25)
					//.background(showAnswer(answered: answered, guessedAnswer: guessedAnswer, correctAnswer: correctAnswer))
					.disabled(answered)
				}
			}
			
			
			if answered {
				Button (action: {
					self.answered = false
					if self.questionIndex != (numberOfQuestions - 1) {
						self.questionIndex += 1
					} else {
						page.pageIndex = .quizEnd
					}
				}) {
					Image(systemName: "chevron.right")
						.foregroundColor(.black)
						.padding()
						.overlay(
							Circle()
								.stroke(.blue, lineWidth: 3)
						)
				}
			}
			
			Spacer()
			
		}
		
		
    }

}


func showAnswer(answered: Bool, guessedAnswer: String, correctAnswer: String) -> Color {
	if !answered {
		return Color.gray
	} else {
		if guessedAnswer == correctAnswer {
			return Color.green
		} else {
			return Color.red
		}
	}
}

struct QuizEndView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var body: some View {
		Text("Done!")
	}
}

struct QuizEndViewPreviews: PreviewProvider {
	static var previews: some View {
		QuizEndView().environmentObject(ViewIndex())
	}
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
		QuizView(quizType: .sawmill).environmentObject(ViewIndex())
    }
}

