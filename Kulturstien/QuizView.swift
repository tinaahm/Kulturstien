//
//  QuizView.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

import SwiftUI

var shuffled: Bool = false
var answeredCorrectly = false

/// View that returns the views for the quiz.
struct QuizView: View {
    
   
	@EnvironmentObject var page : ViewIndex
	
	var quizType: Structure
	@State var questionIndex = 0
	@State var answered : Bool = false
	@State var quiz: Quiz
	@State var guessedIndex : Int? = nil
	@State var guessedAnswer : String? = nil
	@State var finished : Bool = false
	
	init(quizType: Structure) {
		self.quizType = quizType
		self.quiz = getQuizByType(quizType: quizType)
	}
	
	
    var body: some View {
		
		let numberOfQuestions = self.quiz.questions.count
		let correctAnswer: String = self.quiz.questions[questionIndex].correctOption
		let answers: [String] = self.quiz.shuffledAnswers[questionIndex]
		
		ZStack {
		
			Color("BackgroundColour")
			
			VStack (spacing: 15) {
			
				BackButtonView(buttonColour: page.lightMode ? .black : .white)
				HStack {
					Text(self.quiz.name.uppercased())
						.font(.headlineFont)
				}
				.padding()
                Image(self.quiz.imageTitle)
				Text(String(self.questionIndex + 1) + "/" + String(numberOfQuestions))
					.font(.subHeadlineFont)
					.padding(.bottom)
				Text(self.quiz.questions[questionIndex].question)
					.font(.subHeadlineFont)
					.multilineTextAlignment(.center)
					.padding(20)
			
				Group {
					ForEach(0 ..< numberOfQuestions, id: \.self) {
						index in
						Button (action: {
							self.answered = true
							self.guessedAnswer = answers[index]
							self.guessedIndex = index
						}) {
							Text(answers[index])
								.font(.textFont)
								.frame(width: DeviceSize.width * 0.7)
								.padding(20)
								.foregroundColor(.black)
								.background(
										RoundedRectangle(cornerRadius: 15).fill(showAnswer(answered: self.answered, guessedAnswer: self.guessedAnswer, correctAnswer: correctAnswer, currentIndex: index, guessedIndex: self.guessedIndex))
											.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
												
						}
						.disabled(self.answered)
					}
				}
			
			
				if self.answered {
					Button (action: {
						self.answered = false
						if self.questionIndex != (numberOfQuestions - 1) {
							
							self.quiz.questionAnswers[questionIndex] = answeredCorrectly
							
							self.guessedIndex = nil
							self.guessedAnswer = nil
							self.questionIndex += 1
							
							if self.questionIndex == (numberOfQuestions - 1) {
							 self.finished = true
							}
							
						} else {
							
							self.quiz.questionAnswers[questionIndex] = answeredCorrectly
							if !checkIfPastQuizAnswersAreCorrect(answerArray: getAnswersArray(page: page, selection: self.quizType)) {
								setAnswersArray(page: page, selection: self.quizType, answerArray: self.quiz.questionAnswers)
							}
							
							self.guessedIndex = nil
							self.guessedAnswer = nil
							page.currentQuiz = self.quiz
							page.pageIndex = .quizEnd
						}
					}) {
						Text(self.finished ? "Avslutt" : "Neste")
							.font(.textFont)
							.frame(width: DeviceSize.width * 0.4)
							.padding()
							.foregroundColor(.black)
							.background(
								RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.984, green: 0.984, blue: 0.984))
									.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
						}
						.padding()
				}
				Spacer()
			}
			
		}
		.background(Color("BackgroundColour"))
    }

	/// Checks for any wrong answers in the given array.
	///
	/// - Parameters:
	/// 	- answerArray:  The array containing the correctness of the users answers.
	///
	/// - Returns: True if the user has answered correctly on all questions; false otherwise.
	func checkIfPastQuizAnswersAreCorrect(answerArray: [Bool]) -> Bool {
		for answer in answerArray {
			if !answer {
				return false
			}
		}
		return true
	}

	/// Checks for any wrong answers in the given array.
	///
	/// - Parameters:
	/// 	- answered:  Whether or not the user has answered.
	/// 	- guessedAnswer:  The answer the user has guessed.
	/// 	- correctAnswer:  The answer which is correct.
	/// 	- currentIndex:  The index of the current button.
	/// 	- guessedIndex:  The index of the button the user pressed.
	///
	/// - Returns: The colour relating to the validity of the answer.
	func showAnswer(answered: Bool, guessedAnswer: String?, correctAnswer: String, currentIndex: Int, guessedIndex: Int?) -> Color {
		if !answered {
			return (Color.white)
		} else {
			
			if guessedIndex != currentIndex {
				return (Color.white)
			}
			
			if guessedAnswer == correctAnswer {
				answeredCorrectly = true
				return Color.green
			} else {
				answeredCorrectly = false
				return Color.red
			}
		}
	}
}

/*
struct QuizView_Previews: PreviewProvider {
	static var previews: some View {
		QuizView(quizType: .logBooms).environmentObject(ViewIndex())
	}
}*/
