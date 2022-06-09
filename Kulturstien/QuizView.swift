//
//  QuizView.swift
//  Kulturstien
//
//  Created by Tina on 16/05/2022.
//

import SwiftUI

var shuffled: Bool = false
var answeredCorrectly = false

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
				ForEach(0 ..< numberOfQuestions) {
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
									RoundedRectangle(cornerRadius: 15).fill(showAnswer(answered: self.answered, guessedAnswer: self.guessedAnswer, correctAnswer: correctAnswer, currentIndex: index, guessedIndex: self.guessedIndex, quiz: self.quiz, quizIndex: self.questionIndex))
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

}

func checkIfPastQuizAnswersAreCorrect(answerArray: [Bool]) -> Bool {
	for answer in answerArray {
		if !answer {
			return false
		}
	}
	return true
}

func showAnswer(answered: Bool, guessedAnswer: String?, correctAnswer: String, currentIndex: Int, guessedIndex: Int?, quiz: Quiz, quizIndex: Int) -> Color {
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

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
		QuizView(quizType: .logBooms).environmentObject(ViewIndex())
    }
}

func getNumberOfCorrectAnswers(resultArray: [Bool]) -> Int {
	var i : Int = 0
	for result in resultArray {
		if result == true {
			i += 1
		}
	}
	return i
}

func setAnswersArray(page: ViewIndex, selection: Structure, answerArray: [Bool]) {
	switch selection {
	case .mill:
		page.millAnswers.removeAll()
		page.millAnswers.append(contentsOf: answerArray)
	case .sawmill:
		page.sawMillAnswers.removeAll()
		page.sawMillAnswers.append(contentsOf: answerArray)
	case .dam:
		page.damAnswers.removeAll()
		page.damAnswers.append(contentsOf: answerArray)
	case .logBooms:
		page.logBoomsAnswers.removeAll()
		page.logBoomsAnswers.append(contentsOf: answerArray)
	case .none:
		return
	}
}

func getAnswersArray(page: ViewIndex, selection: Structure) -> [Bool] {
	switch selection {
	case .mill:
		return page.millAnswers
	case .sawmill:
		return page.sawMillAnswers
	case .dam:
		return page.damAnswers
	case .logBooms:
		return page.logBoomsAnswers
	case .none:
		return [Bool]()
	}
}

func resultImageToDisplay(numberOfCorrectAnswers: Int, numberOfQuestions: Int) -> String {
	if numberOfCorrectAnswers == numberOfQuestions {
		return "Trophy-1"
	} else {
		return "SadTroll"
	}
}
